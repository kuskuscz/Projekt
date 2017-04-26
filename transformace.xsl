<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <style> table {border-collapse: collapse; width:800px;} .jmeno {background-color:#87cefa }</style>
  <body>
  <div style="margin:0px auto;width:800px">
  <h1>Elektronický přehled školy</h1>
  <xsl:value-of select="škola/@název"/> <br></br>
  <xsl:value-of select="škola/@ulice"/> <br></br>
  <xsl:value-of select="škola/@město"/>, <xsl:value-of select="škola/@PSČ"/>,tel. : <xsl:value-of select="škola/@infolinka"/> <br></br>
    <xsl:value-of select="škola/@web"/> <br></br>
  <hr></hr>
  <h2>Seznam žáků ve třídách</h2>
  <xsl:for-each select="škola/třída">

  <h3>Třída: <xsl:value-of select="@id"/> </h3>
  <table border="1">
    <tr bgcolor="#87cefa">
     <th>ID</th>
      <th>Jméno</th>
      <th>Příjmení</th>
    </tr>
    <xsl:for-each select="žák">
      <xsl:sort select="@id"></xsl:sort>
    <tr>
      <td><xsl:value-of select="@id"/></td>
      <td><xsl:value-of select="jméno"/></td>
      <td><xsl:value-of select="příjmení"/></td>
    </tr>
    </xsl:for-each>
  </table>
   <br></br>
  </xsl:for-each>
  
  <hr></hr>
    <h2>Známky žáků</h2>
  <xsl:for-each select="škola/třída">
  <h3>Třída: <xsl:value-of select="@id"/>  <br></br></h3>

 
 <xsl:for-each select="žák">
 <xsl:sort select="příjmení"></xsl:sort>
  <table border="1">
<tr><th colspan="5" align="center" class="jmeno"><xsl:value-of select="jméno"/>  &#160;<xsl:value-of select="příjmení"/> </th></tr>    
    <tr bgcolor="#f0f8ff">
     
     <th>Předmět</th>
      <th>Známka</th>
   <th>Téma</th>
   <th>Váha</th>
   <th>Datum udělení</th>
    </tr>
    
     <xsl:for-each select="známky/prvnipololeti/predmět">
    <tr>
        
    <td><xsl:value-of select="@id"/></td>
    <td><xsl:value-of select="známka/hodnota"/></td>
    <td><xsl:value-of select="známka/téma"/></td>
   <td><xsl:value-of select="známka/váha"/></td>
     <td><xsl:value-of select="známka/datumUdělení"/></td>
    </tr>
   </xsl:for-each>
    <xsl:for-each select="známky/druhepololeti/predmět">
    <tr>
        
    <td><xsl:value-of select="@id"/></td>
    <td><xsl:value-of select="známka/hodnota"/></td>
 <td><xsl:value-of select="známka/téma"/></td>
 <td><xsl:value-of select="známka/váha"/></td>
     <td><xsl:value-of select="známka/datumUdělení"/></td>
    </tr>
   </xsl:for-each>
  </table>
  <br></br>
  </xsl:for-each>  
      </xsl:for-each>
   
   
   
   
   
   
   
   
   
   <hr></hr>
    <h2>Poznámky žáků</h2>
  <xsl:for-each select="škola/třída">
  <h3>Třída: <xsl:value-of select="@id"/>  <br></br></h3>

 
 <xsl:for-each select="žák[poznámky/prvnipololeti != '' and poznámky/druhepololeti != '']">
 <xsl:sort select="příjmení"></xsl:sort>
  <table border="1">
<tr><th colspan="5" align="center" class="jmeno"><xsl:value-of select="jméno"/>  &#160;<xsl:value-of select="příjmení"/> </th></tr>    
    <tr bgcolor="#f0f8ff">
     
     <th>Datum udělení</th>
      <th>Zadal(a)</th>
   <th>Poznámka</th>
   
    </tr>
    
     <xsl:for-each select="poznámky/prvnipololeti/poznámka">
    <tr>
        
    <td><xsl:value-of select="@datum"/></td>
    <td><xsl:value-of select="@zadánoOd"/></td>
     <td><xsl:value-of select="."/></td>
    </tr>
   </xsl:for-each>
    <xsl:for-each select="poznámky/druhepololeti/poznámka">
    <tr>
    
    
    <td><xsl:value-of select="@datum"/></td>
    <td><xsl:value-of select="@zadánoOd"/></td>
    <td><xsl:value-of select="."/></td>
 
    </tr>
   </xsl:for-each>
  </table>
  <br></br>
  </xsl:for-each>  
      </xsl:for-each>
   
   
   
   
   
   
   
   
   
  <hr></hr>
    <h2>Kontakty na žáky a rodiče, trvalá bydliště</h2>
  <xsl:for-each select="škola/třída">
  <h3>Třída: <xsl:value-of select="@id"/>  <br></br></h3>

 
 <xsl:for-each select="žák">
 <xsl:sort select="příjmení"></xsl:sort>
  <table border="1">
<tr><th colspan="6" align="center" class="jmeno"><xsl:value-of select="jméno"/>  &#160;<xsl:value-of select="příjmení"/> </th></tr>    
    <tr bgcolor="#f0f8ff">
     
     <th>mobil</th>
      <th>pevná linka</th>
   <th>e-mail</th>
   <th>ulice</th>
   <th>město</th>
   <th>PSČ</th>
    </tr>
    
     
    <tr>
        
    <td><xsl:value-of select="kontaktŽák/spojení/mobil"/></td>
    <td><xsl:value-of select="kontaktŽák/spojení/pevnáLinka"/></td>
    <td><xsl:value-of select="kontaktŽák/spojení/email"/></td>
    <td><xsl:value-of select="kontaktŽák/adresa/ulice"/></td>
        <td><xsl:value-of select="kontaktŽák/adresa/město"/></td>
            <td><xsl:value-of select="kontaktŽák/adresa/PSČ"/></td>
    </tr>
  
   <tr><td colspan="6" align="center" bgcolor="#f0f8ff"><b>Kontakt na rodiče</b></td></tr>
    
    <tr>
    
    
    <td><xsl:value-of select="kontaktRodič/spojení/mobil"/></td>
    <td><xsl:value-of select="kontaktRodič/spojení/pevnáLinka"/></td>
    <td><xsl:value-of select="kontaktRodič/spojení/email"/></td>
    <td><xsl:value-of select="kontaktRodič/adresa/ulice"/></td>
        <td><xsl:value-of select="kontaktRodič/adresa/město"/></td>
            <td><xsl:value-of select="kontaktRodič/adresa/PSČ"/></td>
    </tr>
   
  </table>
  <br></br>
  </xsl:for-each>  
      </xsl:for-each>   
   
      
   
   <hr></hr>
   <xsl:value-of select="škola/@název"/> <br></br>
  <xsl:value-of select="škola/@ulice"/> <br></br>
  <xsl:value-of select="škola/@město"/>, <xsl:value-of select="škola/@PSČ"/>,tel. : <xsl:value-of select="škola/@infolinka"/> <br></br>
     <xsl:value-of select="škola/@web"/> <br></br>
   
   
   </div>
  </body>
  </html>
</xsl:template>

</xsl:stylesheet>