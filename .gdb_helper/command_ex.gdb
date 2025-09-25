source ~/.gdb_helper/python_gdb_ex.py

define cui
	if $argc == 0
		set $_pattern = ""
		printf "No pattern is given, continue until meet debug info...\n"
	else
		set $_pattern = $arg0
		printf "Continue until meet `%s` in `symtab.fullname():function().name`...\n", $arg0
	end

	python import re
	python ori_logging_info = gdb.execute("show logging", to_string=True).split("\n")
	python gdb.set_convenience_variable("_ori_logging_enabled", re.match(r".*enabled:\s+(\w+):", ori_logging_info[1]).group(1))
    python ori_logging_file = re.match(r".*\"(.*)\"", ori_logging_info[2]).group(1)
    python gdb.set_convenience_variable("_ori_logging_redirect", re.match(r".*redirect:\s+(\w+):", ori_logging_info[4]).group(1))

    set logging file /dev/null
    set logging redirect on
    set logging enabled on
  	
	call $_continue_until_interest($_pattern) 
	
	if $_ori_logging_enabled == "on"
		set logging enabled on
	else
		set logging enabled off
	end

	if $_ori_logging_redirect == "on"
		set logging redirect on 
	else
		set logging redirect off
	end

	python gdb.execute(f"set logging file {ori_logging_file}")
	
	if $argc == 0
		printf "Hit debug info and stop.\n"
	else
		printf "Hit %s and stop.\n", $arg0
	end
