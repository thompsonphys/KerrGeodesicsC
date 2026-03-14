from setuptools import setup, Extension
import os

prefix = os.environ.get("CONDA_PREFIX", "/usr")

kerrgeodesics_extension = Extension(
    "_kerrgeodesics",
    sources=["kerrgeodesics_wrap.c", "korb.c"],
    include_dirs=[prefix + "/include"],
    library_dirs=[prefix + "/lib"],
    runtime_library_dirs=[prefix + "/lib"],
    libraries=["m", "gsl", "gslcblas", "fftw3"],
    extra_compile_args=["-std=gnu99", "-O3"],
)

setup(ext_modules=[kerrgeodesics_extension])
