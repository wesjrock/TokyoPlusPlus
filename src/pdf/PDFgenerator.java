package pdf;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import java.awt.Desktop;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 *
 * @author Orlandi
 */
public class PDFgenerator {
    private Document file;
    private PdfPTable table;
    
    /* open a new pdf file */
    public void newFile(String nome)
            throws DocumentException, FileNotFoundException {
        
        /* if the object already have one opened, close it */
        if(this.file != null) {
            file.close();
        }
        
        this.file = new Document();
        
        PdfWriter.getInstance(file, new FileOutputStream(nome));

        file.open();
    }
    
    /* open and show the pdf file with default user's tool */
    public void readFile(String name) throws IOException {
        File readFile = new File(name); 
        
        Desktop.getDesktop().open(readFile);
    }
    
    /* insert a new paragraph in pdf file */
    public void insertParagraph(String paragraph) throws DocumentException {
        this.file.add(new Paragraph(paragraph));
    }
    
    /* start a new table in pdf file */
    public void newHeaderTable(String ... header) {
        this.table = new PdfPTable(header.length);
        PdfPCell cell;

        for(String h : header) {
            cell = new PdfPCell(new Paragraph(h));
            table.addCell(cell);
        }
    }
    
    /* put a new line in table (table must be initialized) */
    public void newLineTable(String ... line) {
        PdfPCell cell;

        for(String l : line) {
            cell = new PdfPCell(new Paragraph(l));
            table.addCell(cell);
        }
    }
    
    public void finishTable() throws DocumentException {
        this.file.add(table);
    }
    
    public void closeFile() {
        file.close();
    }
}