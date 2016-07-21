
/*
    pbrt source code is Copyright(c) 1998-2015
                        Matt Pharr, Greg Humphreys, and Wenzel Jakob.

    This file is part of pbrt.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are
    met:

    - Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.

    - Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
    IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
    TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
    PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
    HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
    SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
    LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
    DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
    THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
    OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

 */

//#include "stdafx.h"

// integrators/tlt.cpp*
#include "integrators/tlt.h"
#include "scene.h"
#include "interaction.h"
#include "paramset.h"
#include "bssrdf.h"
#include "sampling.h"
#include "stats.h"
#include "film.h"
#include "camera.h"

STAT_PERCENT("Integrator/Zero-radiance paths", zeroRadiancePaths, totalPaths);
STAT_INT_DISTRIBUTION("Integrator/Path length", pathLength);

TltIntegrator *CreateTltIntegrator(const ParamSet &params,
                                     std::shared_ptr<Sampler> sampler,
                                     std::shared_ptr<const Camera> camera) {
    int maxDepth = params.FindOneInt("maxdepth", 5);
    int np;
    const int *pb = params.FindInt("pixelbounds", &np);
    Bounds2i pixelBounds = camera->film->GetSampleBounds();
    if (pb) {
        if (np != 4)
            Error("Expected four values for \"pixelbounds\" parameter. Got %d.",
                  np);
        else {
            pixelBounds = Intersect(pixelBounds,
                                    Bounds2i{{pb[0], pb[2]}, {pb[1], pb[3]}});
            if (pixelBounds.Area() == 0)
                Error("Degenerate \"pixelbounds\" specified.");
        }
    }
    return new TltIntegrator(maxDepth, camera, sampler, pixelBounds);
}

// TltIntegrator Method Definitions
Spectrum TltIntegrator::Li(const RayDifferential &r, const Scene &scene,
                            Sampler &sampler, MemoryArena &arena,
                            int depth) const {

    ProfilePhase p(Prof::SamplerIntegratorLi);
    RayDifferential ray(r);
    Spectrum L(0.f), beta(1.f);

    while (depth<=maxDepth) 
    {
        // if exit scene
        SurfaceInteraction isect;
        if (not scene.Intersect(ray, &isect)) 
            break;

        // if light source
        L = isect.Le(-ray.d);
        if (not L.IsBlack()) 
            break;

        // if no bsdf
        isect.ComputeScatteringFunctions(ray, arena);
        if (!isect.bsdf)
            break;

        /*
        // Sample BSDF to get new path direction
        Vector3f wo = -ray.d, wi;
        Float pdf;
        BxDFType flags;
        Spectrum f = isect.bsdf->Sample_f(wo, &wi, sampler.Get2D(), &pdf, BSDF_ALL, &flags);
        if (f.IsBlack() || pdf == 0.f) break;
        beta *= f * AbsDot(wi, isect.shading.n) / pdf;
        ray = isect.SpawnRay(wi);
        */

        // Sample chosen _BxDF_
        Vector3f wo = -ray.d;
        Vector3f wi = UniformSampleSphere(sampler.Get2D());
        float pdf = UniformSpherePdf();
        Spectrum f = isect.bsdf->f(wo, wi);
        beta *= f * AbsDot(wi, isect.shading.n) / pdf;
        ray = isect.SpawnRay(wi);

        depth++;
    }

    ReportValue(pathLength, depth);
    return L * beta;

}

