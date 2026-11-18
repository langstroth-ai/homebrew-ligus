# homebrew-hive: the Langstroth tap

Homebrew tap of [Langstroth](https://github.com/langstroth-ai), the
organisation behind [Ligus](https://ligus.ai)
([source](https://github.com/langstroth-ai/ligus), [docs](https://docs.ligus.ai)).
Langstroth is named after the Langstroth frame hive; Ligus is short for
*ligustica* (*Apis mellifera ligustica*, the Italian honeybee). The repository
keeps its old name, `homebrew-hive`, so the tap is `langstroth-ai/hive`.

```bash
brew install langstroth-ai/hive/ligus                 # CLI: ligus
brew install --cask langstroth-ai/hive/ligus-app      # desktop app (Apple Silicon)
```

Upgrade with `brew upgrade ligus` / `brew upgrade --cask ligus-app`. The cask is
**Apple-Silicon-only** and the DMGs are signed and notarized, so it opens
normally. The formula is called `ligus` and the cask `ligus-app` so that
`brew install langstroth-ai/hive/ligus` is never ambiguous.

Homebrew trusts third-party taps explicitly. If `brew` refuses to load a
formula or cask from this tap, trust it once:

```bash
brew trust langstroth-ai/hive
```

## Coming from Hive

This tap used to be `honeyhive-ai/hive`, with the `hive-cli` formula and the
`hive` cask. Hive is discontinued: both are kept here, **disabled**, so
`brew upgrade` and `brew info` tell existing users that Ligus replaces them.
Ligus installs only the `ligus` command; there is no `hive` command. Switch by
hand:

```bash
brew uninstall hive-cli; brew uninstall --cask hive
brew install langstroth-ai/hive/ligus
brew install --cask langstroth-ai/hive/ligus-app
```

A tap added as `honeyhive-ai/hive` keeps working through GitHub's redirect;
`brew untap honeyhive-ai/hive && brew tap langstroth-ai/hive` gives it the new
name.

## Maintenance

The canonical cask is edited in the main repo at
[`deploy/homebrew/Casks/ligus-app.rb`](https://github.com/langstroth-ai/ligus/blob/main/deploy/homebrew/Casks/ligus-app.rb);
each Ligus release updates `Formula/ligus.rb` and `Casks/ligus-app.rb` here
(version, URLs and sha256) automatically. Until the first release (v0.1.0) both
carry placeholder sha256 values marked `TODO(release)`.

There is no `formula_renames.json` / `cask_renames.json` moving `hive-cli` to
`ligus` and `hive` to `ligus-app`, and no `tap_migrations.json`: Homebrew
applies renames only once the old formula and cask are deleted (`brew audit
--tap` refuses both together), the disabled `hive-cli` and `hive` entries are
kept on purpose, and the new names live in this same tap. Delete the disabled
entries first if the tap should migrate installs automatically instead.
