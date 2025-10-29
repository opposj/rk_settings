Settings RKWS is using.

*Currently including:*
1. The GDB settings.
2. The Vim settings.
3. A modified pdbp debuger.

*How to use:*
1. git clone --recursive --shallow-submodules --depth 1 https://github.com/opposj/rk_settings.git
2. mv rk_settings/.vim ~/
3. mv rk_settings/.vimrc ~/
4. mv rk_settings/.gdb_helper ~/
5. cat ~/.gdb_helper/gdb.init >> ~/.gdbinit
6. pip install rk_settings/pdbp  # libreadline.so is required.
7. rm -rf rk_settings
