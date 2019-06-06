# git-sync
<a href='https://ko-fi.com/A417UXC'><img height='36' style='border:0px;height:36px;' src='https://az743702.vo.msecnd.net/cdn/kofi2.png?v=0' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>

- [![](https://images.microbadger.com/badges/version/jorgeandrada/git-sync:latest.svg)](https://microbadger.com/images/jorgeandrada/git-sync:latest "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/jorgeandrada/git-sync:latest.svg)](https://microbadger.com/images/jorgeandrada/git-sync:latest "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/commit/jorgeandrada/git-sync:latest.svg)](https://microbadger.com/images/jorgeandrada/git-sync:latest "Get your own commit badge on microbadger.com")

A better Git synchronization sidecar container.
Forked from appertly/docker-git-sync

## Environment Variables

We use a lot of the same environment variables that the Kubernetes git-sync container does

* `GIT_SYNC_REPO` – The URL for the Git repository.
* `GIT_SYNC_BRANCH` – The branch to clone. `master` by default.
* `GIT_SYNC_DEPTH` – The history depth to pull (by default, unspecified).
* `GIT_SYNC_ROOT` – The directory into which the repository will be cloned (`/git` by default).
* `GIT_SYNC_PERMISSIONS` – Any cloned files will be `chmod`ed to this
* `GIT_SYNC_SSH` – Whether we should use SSH (false by default).
* `GIT_SYNC_WAIT` – The number of seconds to wait between pulls (`30` by default).
* `GIT_SYNC_ONE_TIME` – Whether we should clone once and never pull again.
* `GIT_SYNC_USERNAME` – The auth username to use.
* `GIT_SYNC_PASSWORD` – The auth password to use.
* `GIT_SYNC_KNOWN_HOSTS` - The known_hosts file content

Plus we add a couple more.

* `GIT_SYNC_CHOWN` – Any cloned files will be `chown`ed to this
* `GIT_SYNC_CHGRP` – Any cloned files will be `chgrp`ed to this
* `GIT_SYNC_POST_PULL` – This is a command that will be run after any `git clone` or `git pull`.

## SSH Keys

You can provide SSH keys to the container in one of two ways.

1. You can mount it at `/root/.ssh/id_rsa` with a mode of 400.
2. You can provide it in the environment variable `GIT_SYNC_PRIVATE_KEY` and it will be written to the proper location.
