# homebrew-hive: the Langstroth tap

Homebrew tap of [Langstroth](https://github.com/langstroth-ai), the
organisation behind [Ligus](https://ligus.ai)
([source](https://github.com/langstroth-ai/ligus), [docs](https://docs.langstroth.ai)).
Langstroth is named after the Langstroth frame hive; Ligus is short for
*ligustica* (*Apis mellifera ligustica*, the Italian honeybee). The repository
is `homebrew-hive`, so the tap is `langstroth-ai/hive`.

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

## Maintenance

The canonical cask is edited in the main repo at
[`deploy/homebrew/Casks/ligus-app.rb`](https://github.com/langstroth-ai/ligus/blob/main/deploy/homebrew/Casks/ligus-app.rb);
each Ligus release updates `Formula/ligus.rb` and `Casks/ligus-app.rb` here
(version, URLs and sha256) automatically. Until the first release (v0.1.0) both
carry placeholder sha256 values marked `TODO(release)`.

The disabled `hive-cli` formula and `hive` cask are kept on purpose: `brew
info` and `brew upgrade` on either point at Ligus. There are no
`formula_renames.json`, `cask_renames.json` or `tap_migrations.json` files.
