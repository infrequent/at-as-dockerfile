## 0.1.2 (release date: 19 Jan 2017)
 * Updated dependencies for **Debian Jessie** the `libgnutls-dev` package was renamed to `libgnutls28-dev` causing wget-lua to fail building. `wget-lua not successfully built.`

## 0.1.1 (release date: 11 May 2015)

 * Improved image, now uses phusion baseimage:0.9.9 to fix docker PID1 zombie reaping problem and also handle graceful shutdown correctly.
 * Startup process now uses phusion/baseimage(`/sbin/my_init`) 
 * Initial release dockerfile renamed to dockerfile_ir.bak and moved to bak directory
 
## 0.1.0 (release date: 27 April 2015)

 * Initial release
