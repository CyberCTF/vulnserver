# Vulnserver

[Vulnserver](https://github.com/stephenbradshaw/vulnserver) by Stephen Bradshaw
([The Grey Corner](http://thegreycorner.com/)): a multithreaded Windows TCP server whose commands
are each vulnerable to a different kind of buffer overflow, for learning exploit development.
This repository runs it with [Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml)
describes the machine, and [`provision/main.yml`](provision/main.yml) installs upstream's shipped
`vulnserver.exe` and `essfunc.dll` (vendored unchanged in [`vulnserver/`](vulnserver), with
their C source) from a controller.

| Machine | Services |
| --- | --- |
| win01 (Windows Server 2019) | Vulnserver 9999, RDP 3389 |

Vulnserver starts at every boot (a scheduled task running as SYSTEM). DEP is turned off
(`bcdedit /set {current} nx AlwaysOff`) so the classic stack, SEH and egghunter exercises work as
written. RDP is on so you can attach a debugger (log in as vagrant/vagrant; bring your own
debugger, such as x32dbg).

## Run it

```bash
isoloom run vagrant
isoloom test vagrant
```

About 4 GB of memory (3 GB for the machine, 1 GB for the controller). The Windows Server 2019
box is an evaluation build downloaded by Vagrant. Lab guide: the tutorials listed in
[upstream's readme](vulnserver/readme.md).

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

BSD-3-Clause, as Vulnserver ([LICENSE](LICENSE)). This machine is deliberately vulnerable: keep
it isolated.
