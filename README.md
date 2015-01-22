## ICT-EU 
### What is it?
ICT-EU is a shell script written by Marcos Marado to, using EU’s website as a
data source, generate a CSV file with information about all Information Society
EU Programmes. 

### What’s the output?
For each programme, list:
* Title;
* Description;
* Each of the "Project ID card" fields;
* Participating partners (number of partners and number of partner countries).

The output is in the form of a CSV file.

### How does it work?
This script scrolls through the information at
http://ec.europa.eu/information\_society/apps/projects/index.cfm?menu=secondary
and parses it.

### Usage
This was written having UNIX-based systems in mind. This usage section assumes
you are in such a system (GNU/Linux; MacOS; etc.). Suggestions on how to
enhance this section on other systems are welcome.

Dependencies:
* Wget
* html2text.

The following steps assume you have a clone of this repository on your system.

1. Open a terminal;
2. Go to the directory where this repository is;
3. Type ``sh ICT-EU.sh``;
4. A new CSV file called final.csv was created in the directory.
