const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();
    const windows = b.option(bool, "windows", "create windows build") orelse false;

    const exe = b.addExecutable("benchmark", "src/main.zig");
    exe.addCSourceFile("src/stb_image_impl.c", &[_][]const u8{"-std=c99"});
    exe.setBuildMode(mode);
    exe.linkLibC();
    exe.addIncludeDir("./src");

    if (windows) {
        exe.setTarget(.{
            .cpu_arch = .x86_64,
            .os_tag = .windows,
            .abi = .gnu,
        });
    }

    const run_cmd = exe.run();
    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    b.default_step.dependOn(&exe.step);
    b.installArtifact(exe);
}
