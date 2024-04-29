# Path to the Ghostscript executable
$GhostscriptPath = "C:\Program Files\gs\gs10.03.0\bin\gswin64c.exe"

# Input PDF file path
$InputPDF = "\\192.168.0.112\home\Mateusz\Genealogia\Gomulscy\GomulscyFT\latex\GomulscyFT.pdf"

# Compressed Output file path
$OutputFile = "\\192.168.0.112\home\Mateusz\Genealogia\Gomulscy\GomulscyFT\Historia rodziny Gomulskich z Desna.pdf"

# Arguments for Ghostscript
$Arguments = "-dNOPAUSE -dQUIET -dBATCH -dPrinted=false -dAutoRotatePages=/None -sDEVICE=pdfwrite -o `"$OutputFile`" -f `"$InputPDF`""

# Execute Ghostscript with the specified arguments
Start-Process -FilePath $GhostscriptPath -ArgumentList $Arguments -NoNewWindow -Wait