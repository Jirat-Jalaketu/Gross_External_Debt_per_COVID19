function Maindata = importaver(workbookFile, sheetName, dataLines)
%IMPORTFILE Import data from a spreadsheet
%  MAINDATA = IMPORTFILE(FILE) reads data from the first worksheet in
%  the Microsoft Excel spreadsheet file named FILE.  Returns the numeric
%  data.
%
%  MAINDATA = IMPORTFILE(FILE, SHEET) reads from the specified worksheet.
%
%  MAINDATA = IMPORTFILE(FILE, SHEET, DATALINES) reads from the
%  specified worksheet for the specified row interval(s). Specify
%  DATALINES as a positive scalar integer or a N-by-2 array of positive
%  scalar integers for dis-contiguous row intervals.
%
%  Example:
%  Maindata = importfile("C:\Users\Jirat Jalaketu\OneDrive\เดสก์ท็อป\My Study\Homework\second year\Prob Stat for EE\project\Main_data.xlsx", "Sheet1", [80, 80]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 04-Nov-2021 22:00:08

%% Input handling

% If no sheet is specified, read first sheet
if nargin == 1 || isempty(sheetName)
    sheetName = 1;
end

% If row start and end points are not specified, define defaults
if nargin <= 2
    dataLines = [80, 80];
end

%% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 1);

% Specify sheet and range
opts.Sheet = sheetName;
opts.DataRange = "S" + dataLines(1, 1) + ":S" + dataLines(1, 2);

% Specify column names and types
opts.VariableNames = "sum_2";
opts.VariableTypes = "double";

% Import the data
Maindata = readtable(workbookFile, opts, "UseExcel", false);

for idx = 2:size(dataLines, 1)
    opts.DataRange = "S" + dataLines(idx, 1) + ":S" + dataLines(idx, 2);
    tb = readtable(workbookFile, opts, "UseExcel", false);
    Maindata = [Maindata; tb]; %#ok<AGROW>
end

%% Convert to output type
Maindata = table2array(Maindata);
end