load("@rules_cc//cc:defs.bzl", "cc_library")

"""
Helper functions for defining targets.
"""
def atomic_helper_cc_library(name, pat, size, model):
    cc_library(
        name = name,
        srcs = ["aarch64/lse.S"],
        copts = [
            "-nostdinc",
        ],
        local_defines = [
            "L='{}'".format(pat),
            "SIZE='{}'".format(size),
            "MODEL='{}'".format(model),
        ],
        hdrs = [
            "assembly.h",
        ],
        includes = ["."],
        deps = [
            "//lib:builtin_headers",
        ],
    )
    return name
