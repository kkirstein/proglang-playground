const std = @import("std");

pub fn build(b: *std.Build) void {

    // build options (left as standard so far)
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // executable artifact
    const exe = b.addExecutable(.{ .name = "benchmark", .root_source_file = b.path("./src/main.zig"), .target = target, .optimize = optimize });
    exe.addCSourceFiles(.{ .root = b.path("./src"), .files = &.{"stb_image_impl.c"}, .flags = &.{"-std=c99"} });
    exe.addIncludePath(b.path("./src"));
    exe.linkLibC();

    b.installArtifact(exe);

    // add run step
    const run_exe = b.addRunArtifact(exe);
    const run_step = b.step("run", "Run benchmark application");
    run_step.dependOn(&run_exe.step);

    // test artifact
    const tests_exe = b.addTest(.{ .root_source_file = b.path("./src/main.zig"), .target = target, .optimize = optimize });

    // ad test step
    const run_tests = b.addRunArtifact(tests_exe);
    const test_step = b.step("test", "Run all tests");
    test_step.dependOn(&run_tests.step);
}
