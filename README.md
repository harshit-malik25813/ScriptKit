# ScriptKit

ScriptKit is a Flutter desktop app for formatting homework.

## Release Builds

Desktop release automation is driven by [Fastforge](https://fastforge.dev) and
the GitHub Actions workflow at [.github/workflows/release.yml](.github/workflows/release.yml).

To cut a release, push a tag that starts with `v`:

```bash
git tag v1.2.3
git push origin v1.2.3
```

That workflow will:

1. Package the Windows, macOS, and Linux desktop targets with Fastforge.
2. Stage versioned assets using the tag name, such as `ScriptKit-v1.2.3-linux-x86_64.deb`.
3. Upload the staged files to the GitHub Release for that tag.

## Fastforge Configuration

Packaging and release metadata live in [distribute_options.yaml](distribute_options.yaml).
Platform-specific packaging settings are stored under the desktop packaging
directories, for example:

- [windows/packaging/exe/make_config.yaml](windows/packaging/exe/make_config.yaml)
- [linux/packaging/appimage/make_config.yaml](linux/packaging/appimage/make_config.yaml)
- [linux/packaging/deb/make_config.yaml](linux/packaging/deb/make_config.yaml)
- [linux/packaging/rpm/make_config.yaml](linux/packaging/rpm/make_config.yaml)

The helper script at [scripts/stage-release-asset.sh](scripts/stage-release-asset.sh)
copies each packaged artifact into a tag-scoped staging directory before the
workflow uploads it to the release.

## Local Packaging

To build a specific release job locally, install Fastforge and run the matching
release name from `distribute_options.yaml`.

For example, to build the Linux desktop artifacts:

```bash
dart pub global activate fastforge
export RELEASE_TAG=v1.2.3
fastforge release --name linux-x64
```

## Getting Started

This project is a starting point for a Flutter desktop application.

A few resources to get you started if you are new to Flutter:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
