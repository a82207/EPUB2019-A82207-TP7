<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xhtml" indent="yes" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <link rel="stylesheet" href="w3.css"/>
                <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-metro.css"/>
                <title>Project Record</title>
            </head>
            <body background="http://getwallpapers.com/wallpaper/full/0/a/5/571543.jpg" style="margin-top:30;margin-left:70;margin-right:70;">
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="pr">
        <html>

            <head>
                <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
                <title>Project Record</title>
                <meta charset="UTF-8"/>
            </head>

            <body>
                <div class="w3-container">
                    <div class="w3-card-4">

                        <header
                            class="w3-container w3-panel w3-topbar w3-bottombar w3-border-Orange  w3-light-grey">
                            <center>
                                <h1>Project Record</h1>
                            </center>
                        </header>

                        <div class="w3-container">
                            <ul class="w3-ul">
                                <br/>
                                <xsl:apply-templates select="//metadata"/>
                                <hr width="100%"/>
                                <xsl:apply-templates select="//workteam"/>
                                <hr width="100%"/>
                                <xsl:apply-templates select="//abstract"/>
                                <hr width="100%"/>
                                <xsl:apply-templates select="//deliverables"/>
                                <hr width="100%"/>
                            </ul>
                        </div>

                        <footer
                            class="w3-container w3-panel w3-topbar w3-bottombar w3-border-Orange  w3-light-grey">
                            <center>
                                <h6>Gerado para o Project Record da TP7</h6>
                            </center>
                        </footer>

                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="metadata">
        <center>
            <div class="w3-panel w3-light-grey w3-leftbar w3-rightbar w3-border-Orange">
                <h2 style="color:#D2691E;">
                    <xsl:value-of select="title"/>
                </h2>
                <h5 style="color:#D2691E;">
                    <xsl:value-of select="keyname"/>
                </h5>
            </div>
            <hr width="100%"/>
            <h5 style="color:#D2691E;">SUPERVISOR</h5>
            <font color="white">
            <h5>
                <xsl:value-of select="supervisor/name"/> :
                <a href="{supervisor/homepage}"><xsl:value-of select="supervisor/homepage"/></a>
            </h5>
            <hr width="50%"/>
            <h6> BEGIN-DATE: <xsl:value-of select="bdate"/>
            </h6>
            <h6> END-DATE: <xsl:value-of select="edate"/>
            </h6>
            </font>
        </center>
    </xsl:template>

    <xsl:template match="workteam">
        <center>
            <h4 style="background-color:#D2691E;">WORKTEAM</h4>
        </center>
        <br/>
        <center>
            <table class="w3-table w3-striped w3-bordered w3-centered">
                <tr>
                    <th>
                        <font color="white">
                        <center>NAME</center>
                        </font>
                    </th>
                    <th>
                        <font color="white">
                        <center>MEMBER_ID</center>
                        </font>
                    </th>
                    <th>
                        <font color="white">
                        <center>EMAIL</center>
                        </font>
                    </th>
                </tr>
                <tr class="w3-Sand">
                    <td>
                        <center>
                            <b>
                                <xsl:value-of select="member/name"/>
                            </b>
                        </center>
                    </td>
                    <td>
                        <center>
                            <i>
                                <xsl:value-of select="member/mID"/>
                            </i>
                        </center>
                    </td>
                    <td>
                        <center>
                            <a href="mailto:{member/email}">
                                <xsl:value-of select="member/email"/>
                            </a>
                        </center>
                    </td>
                </tr>
            </table>
        </center>
    </xsl:template>

    <xsl:template match="abstract">
        <center>
            <h4 style="background-color:#D2691E;">ABSTRACT</h4>
        </center>
        <xsl:for-each select="p">
            <font color="white">
            <p style="margin-left:20px; margin-right:20px; colour=white">
                <xsl:value-of select="."/>
            </p>
            </font>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="deliverables">
        <center>
            <h4 style="background-color:#D2691E;">LINKS</h4>

            <xsl:for-each select="deliverable">
                <font color="white">
                <h6> &#65515; <a href="{@path}">
                        <xsl:value-of select="."/>
                    </a>
                    <xsl:choose>
                        <xsl:when test="position() = last()"> . </xsl:when>
                        <xsl:otherwise> , </xsl:otherwise>
                    </xsl:choose>
                </h6>
                </font>
            </xsl:for-each>
        </center>
    </xsl:template>
</xsl:stylesheet>
