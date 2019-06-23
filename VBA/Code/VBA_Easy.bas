Attribute VB_Name = "Module1"
Option Explicit
Sub my_stock_data():

Dim c As Integer
Dim ws_num As Integer
Dim initial_ws As Worksheet
Set initial_ws = ActiveSheet
ws_num = ThisWorkbook.Worksheets.Count

For c = 1 To ws_num
 ThisWorkbook.Worksheets(c).Activate

 Range("H1").Value = "Ticker_Type"
 Range("I1").Value = "Volume_Total"
 Dim Ticker_Type As String
 Dim Volume_Total As Double
 Volume_Total = 0

 Dim Summary_Row As Integer
 Summary_Row = 2

 Dim LastRow As Long
 LastRow = Cells(Rows.Count, 1).End(xlUp).Row

 Dim i As Long
 For i = 2 To LastRow

  If Cells(i + 1, 1).Value <> Cells(i, 1).Value Then
    Ticker_Type = Cells(i, 1).Value
    Volume_Total = Volume_Total + Cells(i, 7).Value
    Range("H" & Summary_Row).Value = Ticker_Type
    Range("I" & Summary_Row).Value = Volume_Total
    Summary_Row = Summary_Row + 1
    Volume_Total = 0
  Else
    Volume_Total = Volume_Total + Cells(i, 7).Value
  End If
 Next i
Next c
initial_ws.Activate
End Sub
