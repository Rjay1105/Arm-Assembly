# Arm-Assembly
This is a script that allows for the easy installation and creation of Assembled Arm programs.
It must be noted that this script will only work on a Linux Debian system.
It must be noted that the provided bash script does not include an emulator to run the assembled programs. This omission has occurred as there are many different emulators. This script will allow for the easy creation of binaries that can be run in whatever way the user sees fit. 

The script was created as it can be tedious to install all the required dependencies to Assemble Assembly code.
The script will check to see if any of the dependencies are already installed if they are will proceed to assemble the code and create the binary file.
If the dependencies are not met then the script will attempt to install the required packages and then proceed when this has been completed.
It is important to note that when the Script is being run for the first time sudo ./Assemble-Auto.sh should be run.
The script will query the user for the location of the Assembly file. The terminal will then tell the user if the script has been executed successfully.
The new binary file will be stored in the same location as the Specified location of the code.

<img width="829" alt="Screenshot 2023-10-20 at 12 44 02" src="https://github.com/Rjay1105/Arm-Assembly/assets/102324608/dfe79f75-e774-4234-9c0f-82388f5cefc5">


#Fixing issues when running the Script
This script should run successfully every time but there have been issues when it was being created.
(Remember that for the bash Script to work, the file must have the correct permissions to execute.)

<img width="561" alt="Screenshot 2023-10-20 at 12 46 30" src="https://github.com/Rjay1105/Arm-Assembly/assets/102324608/289f06e4-7991-4d50-a3b8-bc7f6d217c8e">

Provided within is a very basic hello world script called hello.s. This has been provided for ease of testing that the script is working correctly. When the script has completed there should be 2 files within the directory one called <FILENAME>.s and a binary file with the same name.

<img width="511" alt="Screenshot 2023-10-20 at 12 59 53" src="https://github.com/Rjay1105/Arm-Assembly/assets/102324608/bf664daf-af96-4c9c-8799-d89a38f247a3">
