# CLAUDE.md

## What is this

Net::Jabber::Bot is a Perl module for creating automated XMPP/Jabber bots with built-in safety features (message rate limiting, flood protection, reconnection handling). Built on Moose and Net::Jabber.

## Build and test

```bash
perl Makefile.PL
make
make test          # runs full test suite (~120s due to deliberate sleeps)
prove -l t/        # alternative, -l adds lib/ to @INC
```

Tests 05 and 06 contain `sleep 12` calls (forum join grace period), which is why the suite takes ~2 minutes.

## Dependencies

Install runtime deps:
```bash
cpanm --installdeps .
```

Key deps: Moose, MooseX::Types, Net::Jabber, Log::Log4perl, Mozilla::CA

## Project structure

- `lib/Net/Jabber/Bot.pm` — the entire module (single file)
- `t/` — test suite
- `t/lib/Mock/` — mock Jabber client for testing
- `bot_example.pl`, `gtalk_RSSbot.pl` — usage examples

## Git conventions

- Main branch: `main` locally, `master` on remote (HEAD → origin/master)
- Contributor branches: `koan.toddr.bot/<name>`
- Repo is under `cpan-authors` org: `cpan-authors/perl-net-jabber-bot`

## Code patterns

- Moose-based class with `MooseX::Types` custom types
- Public API uses CamelCase: `SendGroupMessage`, `JoinForum`, `ReconnectToServer`
- Private methods use underscore prefix: `_init_jabber`, `_process_jabber_message`
- Log4perl for logging: `DEBUG()`, `INFO()`, `WARN()`, `ERROR()`
- String interpolation trap: `"$self->method"` does NOT call the method — extract to a variable first

## CI

CI uses GitHub Actions with `testsuite.yml`:
- `ubuntu` + `disttest` jobs gate multi-version matrix
- Multi-version: Perl 5.22+ via `perl-actions/perl-versions@v1`
- Dependencies via `cpanfile` (cpm for ubuntu, cpanm --notest for containers)
