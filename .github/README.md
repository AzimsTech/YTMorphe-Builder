![cover](cover.svg)

# YTMorphe-Builder :hammer: <img src="qrcode.png" width="24%" align="right" />

[![Downloads][downloads-shield]][downloads-url]
[![GitHub Workflow Status][ci-status-shield]][ci-url]  
[![Release][release-shield-morphe-stable]][release-morphe-stable-url]
[![Release][release-shield-morphe]][release-morphe-url]


| **YTMorphe Stable**<br>[![badge][badge-img]][morphe-stable-link] | **YTMorphe Dev**<br>[![badge][badge-img]][morphe-link] |
|---|---|

🤖 Automate the process of downloading, patching, and releasing patched YouTube APKs (Morphe stable and dev).

**Stable** uses the latest non-prerelease Morphe patches and CLI and ignores experimental patches (so it never targets an experimental YouTube version). **Dev** uses the newest Morphe releases, prereleases included, and is published as a GitHub prerelease.

**Stable and Dev install side by side.** Stable is packaged as `app.morphe.android.youtube.stable` and Dev keeps the default `app.morphe.android.youtube`, so each Obtainium link adds its own entry instead of overwriting the other. Updates must be installed from the matching entry.

| Script              | Description                                                                                                                                                         |
|:--------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [`get-latest-cli.sh`](../get-latest-cli.sh) | Retrieves and downloads the latest CLI JAR for the selected release channel ([Morphe][cli-url])                                                              |
| [`get-mpp.sh`](../get-mpp.sh)    | Retrieves and downloads the latest [morphe-patches][morphe-patches-url] .MPP patch file for the selected release channel (stable or dev).                             |
| [`fetch-yt-ver.sh`](../fetch-yt-ver.sh)   | Uses the variant's CLI to extract and print the latest supported YT version from its patches                                                                        |
| [`get-apkmd.sh`](../get-apkmd.sh)      | Fetch the latest apkmd binary release from [its GitHub repo][apkmd-url], download it, save it as apkmd, and make it executable. |
| [`get-keystore.sh`](../get-keystore.sh)      | Fetch the existing keystore from the release, download it and store in cache. |
| [`get-apk-url.sh`](../get-apk-url.sh) | Resolve the variant page URL (universal/nodpi/APK) for a YT version by scraping the release page's variants table, falling back to the release page URL. |

Per-variant settings (CLI repo, release channel, flags, keystore name, tag suffix) live in [`variants/morphe.env`](../variants/morphe.env) and [`variants/morphe-stable.env`](../variants/morphe-stable.env).


<!-- Shields -->

[ci-status-shield]: https://img.shields.io/github/actions/workflow/status/azimstech/YTMorphe-Builder/build.yml?style=for-the-badge
[ci-url]:https://github.com/AzimsTech/YTMorphe-Builder/actions/workflows/build.yml
[downloads-shield]: https://img.shields.io/github/downloads/azimstech/YTMorphe-Builder/total?style=for-the-badge&logo=github
[downloads-url]: https://github.com/azimstech/YTMorphe-Builder/releases/latest
[release-shield-morphe-stable]: https://img.shields.io/github/v/release/AzimsTech/YTMorphe-Builder?filter=*-morphe-stable&style=for-the-badge
[release-shield-morphe]: https://img.shields.io/github/v/release/AzimsTech/YTMorphe-Builder?filter=*-morphe&include_prereleases&style=for-the-badge
[release-morphe-stable-url]: https://github.com/AzimsTech/YTMorphe-Builder/releases/tag/v2.2.0-morphe-stable
[release-morphe-url]: https://github.com/AzimsTech/YTMorphe-Builder/releases/tag/v2.3.0-dev.2-morphe

<!-- Urls -->

[morphe-patches-url]:https://github.com/MorpheApp/morphe-patches
[apkmd-url]:https://github.com/tanishqmanuja/apkmirror-downloader
[cli-url]:https://github.com/MorpheApp/morphe-desktop

<!-- Obtainium -->
[badge-img]: ./badge_obtainium.png

[morphe-stable-link]: https://apps.obtainium.imranr.dev/redirect?r=obtainium%3A%2F%2Fapp%2F%7B%22id%22%3A%22app.morphe.android.youtube.stable%22%2C%22url%22%3A%22https%3A%2F%2Fgithub.com%2FAzimsTech%2FYTMorphe-Builder%22%2C%22author%22%3A%22AzimsTech%22%2C%22name%22%3A%22YouTube%20Morphe%20Stable%22%2C%22preferredApkIndex%22%3A0%2C%22additionalSettings%22%3A%22%7B%5C%22includePrereleases%5C%22%3Afalse%2C%5C%22fallbackToOlderReleases%5C%22%3Atrue%2C%5C%22filterReleaseTitlesByRegEx%5C%22%3A%5C%22%5C%22%2C%5C%22filterReleaseNotesByRegEx%5C%22%3A%5C%22%5C%22%2C%5C%22verifyLatestTag%5C%22%3Afalse%2C%5C%22sortMethodChoice%5C%22%3A%5C%22date%5C%22%2C%5C%22useLatestAssetDateAsReleaseDate%5C%22%3Afalse%2C%5C%22releaseTitleAsVersion%5C%22%3Afalse%2C%5C%22trackOnly%5C%22%3Afalse%2C%5C%22versionExtractionRegEx%5C%22%3A%5C%22%5C%22%2C%5C%22matchGroupToUse%5C%22%3A%5C%22%5C%22%2C%5C%22versionDetection%5C%22%3Afalse%2C%5C%22releaseDateAsVersion%5C%22%3Afalse%2C%5C%22useVersionCodeAsOSVersion%5C%22%3Afalse%2C%5C%22apkFilterRegEx%5C%22%3A%5C%22%5EYTMorphe-Stable_%5C%22%2C%5C%22invertAPKFilter%5C%22%3Afalse%2C%5C%22autoApkFilterByArch%5C%22%3Atrue%2C%5C%22appName%5C%22%3A%5C%22%5C%22%2C%5C%22appAuthor%5C%22%3A%5C%22%5C%22%2C%5C%22shizukuPretendToBeGooglePlay%5C%22%3Afalse%2C%5C%22allowInsecure%5C%22%3Afalse%2C%5C%22exemptFromBackgroundUpdates%5C%22%3Afalse%2C%5C%22skipUpdateNotifications%5C%22%3Afalse%2C%5C%22about%5C%22%3A%5C%22%5C%22%2C%5C%22refreshBeforeDownload%5C%22%3Afalse%2C%5C%22includeZips%5C%22%3Afalse%2C%5C%22zippedApkFilterRegEx%5C%22%3A%5C%22%5C%22%7D%22%2C%22overrideSource%22%3A%22GitHub%22%7D

[morphe-link]: https://apps.obtainium.imranr.dev/redirect?r=obtainium%3A%2F%2Fapp%2F%7B%22id%22%3A%22app.morphe.android.youtube%22%2C%22url%22%3A%22https%3A%2F%2Fgithub.com%2FAzimsTech%2FYTMorphe-Builder%22%2C%22author%22%3A%22AzimsTech%22%2C%22name%22%3A%22YouTube%20Morphe%22%2C%22preferredApkIndex%22%3A0%2C%22additionalSettings%22%3A%22%7B%5C%22includePrereleases%5C%22%3Atrue%2C%5C%22fallbackToOlderReleases%5C%22%3Atrue%2C%5C%22filterReleaseTitlesByRegEx%5C%22%3A%5C%22%5C%22%2C%5C%22filterReleaseNotesByRegEx%5C%22%3A%5C%22%5C%22%2C%5C%22verifyLatestTag%5C%22%3Afalse%2C%5C%22sortMethodChoice%5C%22%3A%5C%22date%5C%22%2C%5C%22useLatestAssetDateAsReleaseDate%5C%22%3Afalse%2C%5C%22releaseTitleAsVersion%5C%22%3Afalse%2C%5C%22trackOnly%5C%22%3Afalse%2C%5C%22versionExtractionRegEx%5C%22%3A%5C%22%5C%22%2C%5C%22matchGroupToUse%5C%22%3A%5C%22%5C%22%2C%5C%22versionDetection%5C%22%3Afalse%2C%5C%22releaseDateAsVersion%5C%22%3Afalse%2C%5C%22useVersionCodeAsOSVersion%5C%22%3Afalse%2C%5C%22apkFilterRegEx%5C%22%3A%5C%22%5EYTMorphe_%5C%22%2C%5C%22invertAPKFilter%5C%22%3Afalse%2C%5C%22autoApkFilterByArch%5C%22%3Atrue%2C%5C%22appName%5C%22%3A%5C%22%5C%22%2C%5C%22appAuthor%5C%22%3A%5C%22%5C%22%2C%5C%22shizukuPretendToBeGooglePlay%5C%22%3Afalse%2C%5C%22allowInsecure%5C%22%3Afalse%2C%5C%22exemptFromBackgroundUpdates%5C%22%3Afalse%2C%5C%22skipUpdateNotifications%5C%22%3Afalse%2C%5C%22about%5C%22%3A%5C%22%5C%22%2C%5C%22refreshBeforeDownload%5C%22%3Afalse%2C%5C%22includeZips%5C%22%3Afalse%2C%5C%22zippedApkFilterRegEx%5C%22%3A%5C%22%5C%22%7D%22%2C%22overrideSource%22%3A%22GitHub%22%7D
