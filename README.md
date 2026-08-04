# FlicKey Homebrew tap

Homebrew cask for [FlicKey](https://flickey.site) - fixes wrong-keyboard-layout
typing on macOS.

## Install

```sh
brew install --cask alfital2/tap/flickey
```

That one command taps this repo and installs the app. Naming the cask in full
is also what satisfies the third-party tap trust check added in Homebrew 6, so
prefer it for a first install.

After that, plain `flickey` works everywhere - `brew info --cask flickey`,
`brew upgrade --cask flickey`, and so on. To get the short name without
installing first:

```sh
brew tap alfital2/tap
brew trust alfital2/tap
```

To uninstall:

```sh
brew uninstall --cask flickey          # remove the app
brew uninstall --zap --cask flickey    # also remove preferences and caches
```

## Updates

FlicKey updates itself through Sparkle, so the cask is marked `auto_updates
true` and `brew upgrade` intentionally leaves it alone. If you would rather let
Homebrew do it, run `brew upgrade --cask --greedy flickey`.

## Maintenance

`Casks/flickey.rb` is bumped automatically by
[`.github/workflows/autobump.yml`](.github/workflows/autobump.yml), which checks
`alfital2/FlicKey` for a newer published release every six hours, verifies the
DMG's SHA-256, and commits the change. Nothing here needs a manual edit on
release day.

Two things to keep in mind:

- Only non-prerelease GitHub releases are picked up. Mark QA and diagnostic
  builds as **prerelease** so the tap skips them.
- The release must carry an asset named exactly `FlicKey.dmg`, which is what
  `scripts/release.sh` in the app repo already uploads.

To bump immediately instead of waiting for the schedule:

```sh
gh workflow run autobump.yml --repo alfital2/homebrew-tap
```
