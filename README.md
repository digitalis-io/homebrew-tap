<div align="center">
  <a href="https://digitalis.io">
    <img src="https://cdn.prod.website-files.com/68370d67a3c849c28c22f703/68370d67a3c849c28c22f803_digitalis-logo.svg" alt="Digitalis.io" width="320">
  </a>
</div>

# Digitalis.io Homebrew Tap

Homebrew tap for macOS applications published by [Digitalis.io](https://digitalis.io).

## Quick start

```bash
brew tap digitalis-io/tap
brew install --cask transikey
```

One-liner, without tapping first:

```bash
brew install --cask digitalis-io/tap/transikey
```

Transikey is not signed or notarised, so Gatekeeper blocks the first launch.
Approve it once:

```bash
xattr -dr com.apple.quarantine /Applications/transikey.app
```

## Available casks

| Cask | Description | Homepage |
|------|-------------|----------|
| `transikey` | Desktop client for OpenBao and HashiCorp Vault | <https://github.com/digitalis-io/transikey> |

## Usage examples

### Install and launch Transikey

```bash
brew tap digitalis-io/tap
brew install --cask transikey
xattr -dr com.apple.quarantine /Applications/transikey.app
open /Applications/transikey.app
```

### Upgrade to the latest release

```bash
brew update
brew upgrade --cask transikey
```

Release candidates are published as GitHub pre-releases. The cask's `livecheck`
block includes them, so `brew upgrade` picks up RC builds as they land.

### Inspect, reinstall, or remove

```bash
brew info --cask transikey          # version, URL, caveats
brew reinstall --cask transikey     # re-download and re-install
brew uninstall --cask transikey     # remove the app
brew uninstall --zap --cask transikey  # remove the app plus preferences and caches
```

`--zap` does not remove keychain entries. Sessions and tokens are stored in the
login keychain — delete the `transikey` items in Keychain Access by hand.

### Remove the tap

```bash
brew untap digitalis-io/tap
```

## Reference

| Item | Value |
|------|-------|
| Tap name | `digitalis-io/tap` |
| Repository | `https://github.com/digitalis-io/homebrew-tap` |
| Cask directory | `Casks/` |
| Local checkout | `$(brew --repository)/Library/Taps/digitalis-io/homebrew-tap` |
| Minimum macOS | Ventura (13) for `transikey` |

## Maintainers

Cask files in `Casks/` are generated. The `version` and `sha256` fields are
rendered by the upstream project's release workflow from the published GitHub
release and pushed here automatically — do not edit them by hand in this repo.
Everything else in a cask is edited in the upstream repository, which is the
source of truth.

To test a cask locally before it ships:

```bash
brew audit --cask --online digitalis-io/tap/transikey
brew style Casks/transikey.rb
brew install --cask --force digitalis-io/tap/transikey
```

## Troubleshooting

| Symptom | Fix |
|---------|-----|
| `Cask 'transikey' is unavailable` | Run `brew tap digitalis-io/tap`, then `brew update`. |
| `"transikey" is damaged and can't be opened` | Gatekeeper quarantine. Run `xattr -dr com.apple.quarantine /Applications/transikey.app`. |
| `brew upgrade` does not see a new release | Run `brew update` first; the tap is a git checkout and must be refreshed. |
| SHA-256 mismatch on install | The release asset was replaced. Run `brew update` and retry; if it persists, open an issue upstream. |

## Contact

Maintained by [Digitalis.io](https://digitalis.io).
Support: [digitalis.io/contact](https://digitalis.io/contact).

Licensed under the [Apache License 2.0](LICENSE).
