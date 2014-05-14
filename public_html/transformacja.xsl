<?xml version="1.0" encoding="utf-8"?>
<!-- xmllint noout schema schemat.xsd studenci.xml -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8" />

    <xsl:template match="/">	
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html></xsl:text>
        <html>
            <head>
                <title>XML projekt 3</title>
                <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lato"/>
                <link rel="stylesheet" type="text/css" href="style.css"/>
                
            </head>
            <body>             
       
                <xsl:call-template name="GrupyStudentow"/>         
                <xsl:call-template name="StudentkiZStronaWWW"/>        
                <xsl:call-template name="StudenciZDomena"/>    
                <xsl:call-template name="LataStudentow"/>                    
            </body>
        </html>
    </xsl:template>
    
    <xsl:template name="GrupyStudentow">  
        <h1>Sekcja 1</h1>
        <table>
            <tr>
                <td>Nazwa grupy</td>
                <td>Studenci:</td>
            </tr>   
            <xsl:for-each select="//grupy/grupa">
                <tr>
                    <td>
                        <xsl:value-of select="."/>
                    </td>
                    <td></td>           
                </tr>   
                <xsl:variable name="id_grupy" select="." />
                <!-- <xsl:sort select="nazwisko" data-type="text" lang="pl"/>-->
                <xsl:for-each select="//studenci/student">
                    <xsl:if test="@id_ref_grupy = $id_grupy"> 
                        <tr>
                            <td>                                
                            </td>
                            <td>
                                <xsl:value-of select="nazwisko"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="imie"/>
                            </td>         
                        </tr>
                    </xsl:if>
                </xsl:for-each>                      
            </xsl:for-each>
        </table>
    </xsl:template>
   
    <xsl:template name="StudentkiZStronaWWW">  
        <h1>Sekcja 2</h1>
        <table class="drugatabela">  
            <tr>
                <td>Nazwisko</td>
                <td>Imię</td>
                <td>WWW</td>
            </tr>        
            <xsl:for-each select="//studenci/student[@plec='k']/strona_internetowa">                                                                          
                <tr>
                    <td>
                        <xsl:value-of select="../nazwisko"/>
                    </td>
                    <td>
                        <xsl:value-of select="../imie"/>
                    </td>
                    <td>
                        <xsl:value-of select="../strona_internetowa"/>
                    </td>
                </tr>                                              
            </xsl:for-each>                               
        </table>
    </xsl:template>
    
    <xsl:template name="StudenciZDomena">  
        <h1>Sekcja 3</h1>
        <table class="trzeciatabela"> 
            <tr>
                <td>Nazwisko</td>
                <td>Imię</td>
                <td>E-mail</td>
            </tr>          
            <xsl:for-each select="//studenci/student">
                <xsl:if test="email[contains(text(),'wp.pl')]">                                
                    <tr>
                        <td>
                            <xsl:value-of select="nazwisko"/>
                        </td>                         
                        <td>
                            <xsl:value-of select="imie"/>
                        </td>                        
                        <td>
                            <xsl:value-of select="email"/>
                        </td>                       
                    </tr>                                 
                </xsl:if>
            </xsl:for-each>                               
        </table>
    </xsl:template>
    
    <xsl:template name="LataStudentow">  
        <h1>Lata Studentów</h1>
        <table class="czwartatabela"> 
            <tr>
                <td>Min</td>
                <td>Avr</td>
                <td>Max</td>
            </tr>                                                                           
            <tr>
                <td>
                    <xsl:value-of select="(//studenci/student/wiek[not(. &gt; //studenci/student/wiek)])[1]"/> 
                </td>                         
                <td>
                    <xsl:value-of select="sum(.//studenci/student/wiek) div count(.//studenci/student/wiek)"/>
                </td>                        
                <td>
                    <xsl:value-of select="(//studenci/student/wiek[not(. &lt; //studenci/student/wiek)])[1]"/>  
                </td>                       
            </tr>                                                                      
        </table>
    </xsl:template>

</xsl:stylesheet>