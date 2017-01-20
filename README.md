## ICT-EU 
### What is it?
ICT-EU is a shell script written by Marcos Marado to, using EU’s website as a
data source, generate a CSV file with information about all Information Society
EU Programmes. 

The output is in the form of a CSV file (check
[final.csv](https://github.com/marado/ICT-EU/blob/master/final.csv)).

### How does it work?
Currently, Cordis already exports CSV files, so this script only helps you by
finding the right set of CSVs, fetching them and merging the data into a
single, comprehensive file.

### Shortcomings
A previous version of this script and resulting CSV used to have relevant
fields that this one (still) doesn't.

Previously:
```
"Reference ID";"Title";"Description";"Funded Under";"Area";"Cost";"Contribution";"Reference";"Execution";"Project Status";"Contract Type";"Number of Partners";"Number of partner countries"
```
Currently:
```
"Content type";"Record Number";Acronym;Title;ID;Teaser;Programme;"Start date";"End date";Language;"Available languages";"Last updated";URL
```

Unfortunately the old version stopped working when the website changed, so
there's work to be done in order to re-add those fields in the list again. If
you needed that information, a copy of the last run of the old script is
available at [old.csv](https://github.com/marado/ICT-EU/blob/master/old.csv),
but bear in mind that the information is outdated (extracted at Jan 18, 2015).


### Usage
This was written having UNIX-based systems in mind. This usage section assumes
you are in such a system (GNU/Linux; MacOS; etc.). Suggestions on how to
enhance this section on other systems are welcome.

The following steps assume you have a clone of this repository on your system.

1. Open a terminal;
2. Go to the directory where this repository is;
3. Type ``sh ICT-EU.sh``;
4. A new CSV file called final.csv was created in the directory.
