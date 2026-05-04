# Path to the Ghostscript executable
$GhostscriptPath = "C:\Program Files\gs\gs10.03.0\bin\gswin64c.exe"

# Input PDF file path
$InputPDF = "\\192.168.0.112\home\Mateusz\Genealogia\Gomulscy\GomulscyFT\latex\GomulscyFT.pdf"

# Compressed Output file path
$OutputFile = "\\192.168.0.112\home\Mateusz\Genealogia\Gomulscy\GomulscyFT\Historia_rodziny_Gomulskich_z_Desna.pdf"

# Arguments for PDF
$ArgumentsPDF = @("-dNOPAUSE", "-dQUIET", "-dBATCH", "-sDEVICE=pdfwrite", "-dCompatibilityLevel=1.5", "-dPDFSETTINGS=/ebook", "-dDetectDuplicateImages=true", "-dEmbedAllFonts=true", "-dSubsetFonts=true", "-o `"$OutputFile`"", "-f `"$InputPDF`"")

# Execute Ghostscript for PDF
Start-Process -FilePath $GhostscriptPath -ArgumentList $ArgumentsPDF -NoNewWindow -Wait

# Declare PNG path
$PngPath = $OutputFile -replace '\.pdf$', '.png'

# Arguments for PNG
$ArgumentsPNG = @("-dNOPAUSE", "-dBATCH", "-sDEVICE=png16m", "-r150", "-dTextAlphaBits=4","-dGraphicsAlphaBits=4", "-sOutputFile=`"$PngPath`"", "`"$OutputFile`"")

# Execute Ghostscript for PNG
Start-Process -FilePath $GhostscriptPath -ArgumentList $ArgumentsPNG -NoNewWindow -Wait