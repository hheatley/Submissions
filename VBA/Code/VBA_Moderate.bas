Attribute VB_Name = "Module2"
Option Explicit
Sub my_stock_data():

Dim c As Integer, ws_num As Integer, initial_ws As Worksheet
Set initial_ws = ActiveSheet
ws_num = ThisWorkbook.Worksheets.Count

For c = 1 To ws_num
 ThisWorkbook.Worksheets(c).Activate

 Range("H1").Value = "Ticker_Type"
 Range("I1").Value = "Yearly_Change"
 Range("J1").Value = "Percent_Change"
 Range("K1").Value = "Volume_Total"
 
 Dim Ticker_Type As String, Yearly_Change As Double, Percent_Change As Long, Volume_Total As Double
 Yearly_Change = 0
 Percent_Change = 0
 Volume_Total = 0
 
 Dim Summary_Row As Integer, LastRow As Long
 Summary_Row = 2
 LastRow = Cells(Rows.Count, 1).End(xlUp).Row
 
 Dim i As Long
 For i = 2 To LastRow
  If Cells(i + 1, 1).Value <> Cells(i, 1).Value Then
    Ticker_Type = Cells(i, 1).Value
    Yearly_Change = Yearly_Change + (Cells(i, 6).Value) - (Cells(i, 3).Value)
    'I cannot get either the Yearly_Change or the Percent_Change to calculate correctly.  Have tried: Percent_Change = Yearly_Change / Cells(i, 3).Value'
    Volume_Total = Volume_Total + Cells(i, 7).Value
    Range("H" & Summary_Row).Value = Ticker_Type
    Range("I" & Summary_Row).Value = Yearly_Change
    Range("J" & Summary_Row).Value = Percent_Change
    Range("K" & Summary_Row).Value = Volume_Total
    Summary_Row = Summary_Row + 1
    Volume_Total = 0
    Yearly_Change = 0
    Percent_Change = 0
  Else
    Volume_Total = Volume_Total + Cells(i, 7).Value
    Yearly_Change = Yearly_Change + (Cells(i, 6).Value) - (Cells(i, 3).Value)
    'I cannot get either the Yearly_Change or the Percent_Change to calculate correctly.  Have tried: Percent_Change = Yearly_Change / Cells(i, 3).Value'
  End If
  Range("J" & Summary_Row).NumberFormat = "0.00%"
  If Yearly_Change > 0 Then
   Range("I" & Summary_Row).Interior.ColorIndex = "4"
  Else
   Range("i" & Summary_Row).Interior.ColorIndex = "3"
  End If
 Next i
Next c
initial_ws.Activate
End Sub
