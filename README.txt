Playbooks

- vmsetup/version.yml

  Writes image version into vmsetup/output/XXXY

- vmsetup/setup.yml

  Tags:
  - init
  - contestprep
  - conteststart
  - reprovision
  - contestdone

Schedule

# 15:00 - Enumerate VMs online, check image verison
ansible-playbook vmsetup/version.yml

# 16:00 - Start VM init
ansible-playbook vmsetup/setup.yml --tags init

# 18:00 - Official start of "ioi" reprovisioning
ansible-playbook vmsetup/setup.yml --tags contestprep

# 18:30 - Start unlock screen
ansible-playbook vmsetup/setup.yml --tags conteststart

# 18:45 - Check ioibackup's backup is new

# 19:00 - Whenever VM needs reprovisioning
ansible-playbook -l XXXY vmsetup/setup.yml --tags reprovision

# 00:00 - Done
ansible-playbook vmsetup/setup.yml --tags contestdone


---

15:00 - Connect VM online. (Do not switch to backup unless needed.)
18:00 - HTC will reprovision the "ioi" account. Wait at login screen.
18:30 - Contestants may login to the "ioi" account; HTC will unlock screen shortly after. Contestant can open Firefox, go to CMS page, but NOT do any other work.
19:00 - Contest commences.
00:00 (next day) - Contest ends.
Contestants may leave if no issues (e.g. appeal for extra time). Please leave VM on until HTC announces okay to turn off.
Refer to: https://bit.ly/ioi2020siteinfo

