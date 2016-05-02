package onlineexams;

import java.awt.*;
import java.awt.image.*;
import java.io.*;
import javax.imageio.*;
import java.util.Date;

public class CertifacteGenerator 
{
    final String templateCertificate = "c:\\ajava\\project\\template.png";

    

    public void generateCertificate(String name, String subject, Date d) throws Exception
    {
        //load the template certificate
        File f = new File(templateCertificate);
        BufferedImage bi = ImageIO.read(f);

        //get writable pen for the buffered image
        Graphics g = bi.getGraphics();
        
        //settings
        g.setColor(Color.BLUE);
        Font fnt = new Font("AR ESSENCE", Font.BOLD, 20);
        g.setFont(fnt);
        
        //write on it
        g.drawString(name, 400, 160);
        g.drawString(subject, 400, 260);
        g.drawString(d.toString(), 400, 520);
        
        //save it
        File newFile = new File("c:\\ajava\\project\\"+name + "_"+ subject+".png");
        ImageIO.write(bi, "PNG", newFile);
    }
}
