<cfoutput>

	<!--- Create an instance of the POIUtility.cfc. --->
	<cfset objPOI = new lib.POIUtility() />


	<!--- Simulate a query object. --->
	<cf_makequery name="qGirl">
		||name||hair||best_feature||
		|Julie|Blonde|Forearms|
		|Lydia|Brunette|Eyes|
		|Cynthia|Blonde|Eyes|
	</cf_makequery>


	<!---
		Create a sheet object for this query. This will
		return a structure with the following keys:
		- Query
		- ColumnList
		- ColumnNames
		- SheetName
	--->
	<cfset objSheet = objPOI.GetNewSheetStruct() />

	<!--- Set the query into the sheet. --->
	<cfset objSheet.Query = qGirl />

	<!---
		Define the order of the columns (and which
		columns to include).
	--->
	<cfset objSheet.ColumnList = "name,hair,best_feature" />

	<!---
		We want to include a header Row in our outputted excel
		workbook. Therefore, provide header values in the SAME
		order as the column list above.
	--->
	<cfset objSheet.ColumnNames = "Name,Hair,Best Feature" />

	<!--- Set the sheet name. --->
	<cfset objSheet.SheetName = "Girls" />


	<!---
		Now, let's write the sheet to a workbook on the file
		sysetm (this will create a NEW file). When doing so, we
		have the option to pass either a single sheet object (as
		we are doing in this example, or an array of sheet
		objects). We can also define header and row CSS.

		RowCSS settings are the default for all cells.
	--->
	<cfset objPOI.WriteExcel(
		FilePath = ExpandPath( "./girls.xls" ),
		Sheets = objSheet,
		HeaderCSS = "color: white; background-color:blue;font-size:14pt;",
		RowCSS = "color: black; background-color:white; font-size:12pt; border: 2px thin black ;",
		AltRowCSS = "background-color: grey_25_percent; color: black; border-bottom: 1px thick red ;"
		) />

		File Created #ExpandPath( "./girls.xls" )#<br>
</cfoutput>
