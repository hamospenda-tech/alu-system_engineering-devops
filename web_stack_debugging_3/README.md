# Web stack debugging #3

Debugging a WordPress site on a LAMP stack (Linux, Apache, MySQL, PHP) that returns a 500 error, using `strace`, and automating the fix with Puppet.

## Finding the bug

1. Attach `strace` to an Apache process: `strace -p <apache PID>`
2. In another window, run `curl -sI 127.0.0.1`
3. The trace shows PHP failing to open `/var/www/html/wp-includes/class-wp-locale.phpp` (`ENOENT`, no such file): `wp-settings.php` has a typo, `.phpp` instead of `.php`

## Tasks

| File | Description |
|------|-------------|
| `0-strace_is_your_friend.pp` | Puppet manifest that fixes the `.phpp` typo in `/var/www/html/wp-settings.php` so Apache returns `200 OK` |
