const std = @import("std");

pub fn build(b: *std.Build) void {

    // build options (left as standard so far)
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    //const mode = b.standardReleaseOptions();
    //const windows = b.option(bool, "windows", "create windows build") orelse false;

    // executable artifact
    const exe = b.addExecutable(.{ .name = "benchmark", .root_source_file = b.path("./src/main.zig"), .target = target, .optimize = optimize });
    //exe.addCSourceFile("src/stb_image_impl.c", &[_][]const u8{"-std=c99"});
    exe.addCSourceFiles(.{ .root = b.path("./src"), .files = &.{"stb_image_impl.c"}, .flags = &.{"-std=c99"} });
    exe.addIncludePath(b.path("./src"));

    exe.linkLibC();
    //exe.addIncludeDir("./src");

    //if (windows) {
    //    exe.setTarget(.{
    //        .cpu_arch = .x86_64,
    //        .os_tag = .windows,
    //        .abi = .gnu,
    //    });
    //}

    b.installArtifact(exe);

    // add run step
    const run_exe = b.addRunArtifact(exe);
    const run_step = b.step("run", "Run benchmark application");
    run_step.dependOn(&run_exe.step);
}
