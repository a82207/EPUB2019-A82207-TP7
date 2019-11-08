<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="xhtml" indent="yes" encoding="UTF-8"/>

    <xsl:key name="filmes" match="filme" use="filme"/>

    <xsl:template match="/">
        <xsl:result-document href="filmes-html/index.html">
            <html>
                <head>
                    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
                    <title>Filmes</title>
                    <meta charset="UTF-8"/>
                </head>
                <body>
                    <div class="w3-container">
                        <div class="w3-card-4">

                            <header class="w3-container w3-Blue-Gray">
                                <center>
                                    <h1>Filmes</h1>
                                </center>
                            </header>

                            <div class="w3-container">
                                <ul class="w3-ul">
                                    
                                    <!-- Sidebar -->
                                    <div class="w3-sidebar w3-light-grey w3-bar-block" style="width:10%">
                                        <h3 class="w3-bar-item">Menu</h3>
                                        <a href="#filme" class="w3-bar-item w3-button w3-border-bottom">Filmes</a>
                                        <a href="#genero" class="w3-bar-item w3-button w3-border-bottom">Géneros</a>
                                        <a href="#ator" class="w3-bar-item w3-button w3-border-bottom">Atores</a>
                                    </div>
                                    
                                    <br/>
                                    <!-- Page Content -->
                                    <div style="margin-left:10%">
                                        
                                    <div style="margin-left:2%; margin-right:2%">

                                        <center>
                                            <h2 id="filme" style="color:#5F9EA0;">Índice de Filmes</h2>
                                        </center>
                                        <ul>
                                            <xsl:apply-templates
                                                select="//titulo[not(preceding::titulo = .)]">
                                                <xsl:sort select="."/>
                                            </xsl:apply-templates>
                                        </ul>
                                        <br/>
                                        <center>
                                            <button
                                                class="w3-button w3-white w3-border w3-border-black">
                                                <a href="index.html">Voltar ao início</a>
                                            </button>
                                        </center>
                                        <br/>

                                        <br/>
                                        <center>
                                            <h2 id="genero" style="color:#5F9EA0;">Índice de Géneros</h2>
                                        </center>
                                        <ul>
                                            <xsl:apply-templates
                                                select="//generos/genero[not(preceding::genero = .)]">
                                                <xsl:sort select="."/>
                                            </xsl:apply-templates>
                                        </ul>
                                        <br/>
                                        <center>
                                            <button
                                                class="w3-button w3-white w3-border w3-border-black">
                                                <a href="index.html">Voltar ao início</a>
                                            </button>
                                        </center>
                                        <br/>

                                        <br/>
                                        <center>
                                            <h2 id="ator" style="color:#5F9EA0;">Índice de Atores</h2>
                                        </center>
                                        <ul>
                                            <xsl:apply-templates
                                                select="//atores/ator[not(preceding::ator = .)]">
                                                <xsl:sort select="."/>
                                            </xsl:apply-templates>
                                        </ul>
                                        <br/>
                                        <center>
                                            <button
                                                class="w3-button w3-white w3-border w3-border-black">
                                                <a href="index.html">Voltar ao início</a>
                                            </button>
                                        </center>
                                        <br/>
                                    </div>
                                    </div>
                                </ul>
                            </div>

                            <footer class="w3-container w3-Dark-Gray">
                                <center>
                                    <br/>
                                    <button class="w3-button w3-white w3-border w3-border-black">
                                        <a href="index.html">Voltar ao início</a>
                                    </button>
                                    <br/>
                                    <h6 style="text-shadow:1px 1px 0 #444">Gerado para
                                        EPUB2019-TP7</h6>
                                    <br/>
                                </center>
                            </footer>

                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
        <xsl:apply-templates select="//titulo[not(preceding::titulo = .)]" mode="pagina-individual"/>
        <xsl:apply-templates select="//generos/genero[not(preceding::genero = .)]"
            mode="pagina-individual"/>
        <xsl:apply-templates select="//atores/ator[not(preceding::ator = .)]"
            mode="pagina-individual"/>
    </xsl:template>

    <xsl:template match="titulo">
        <xsl:variable name="t" select="."/>
        <li>
            <a href="{$t}.html">
                <xsl:value-of select="."/>
            </a> (<xsl:value-of select="//filme[titulo = $t]/generos/genero"/> - <xsl:value-of
                select="//filme[titulo = $t]/ano"/>) </li>
    </xsl:template>

    <xsl:template match="generos/genero">
        <xsl:variable name="g" select="."/>
        <li>
            <a href="{$g}.html">
                <xsl:value-of select="."/>
            </a>
        </li>
    </xsl:template>

    <xsl:template match="atores/ator">
        <xsl:variable name="a" select="."/>
        <li>
            <a href="{$a}.html">
                <xsl:value-of select="."/>
            </a>
        </li>
    </xsl:template>

    <xsl:template match="generos/genero" mode="pagina-individual">
        <xsl:variable name="g" select="."/>
        <xsl:result-document href="filmes-html/{$g}.html">
            <html>
                <head>
                    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
                    <title>
                        <xsl:value-of select="."/>
                    </title>
                    <meta charset="UTF-8"/>
                </head>

                <body>
                    <div class="w3-container">
                        <div class="w3-card-4">

                            <header class="w3-container w3-Blue-Gray">
                                <center>
                                    <h1 style="text-shadow:1px 1px 0 #444">
                                        <xsl:value-of select="."/>
                                    </h1>
                                </center>
                            </header>

                            <div class="w3-container">
                                <ol class="w3-ul">
                                    <br/>
                                    <b>
                                        <h4>Filmes:</h4>
                                    </b>
                                    <li>
                                        <xsl:apply-templates
                                            select="//filme[generos/genero = $g]/titulo"/>
                                    </li>
                                    <br/>
                                    <b>
                                        <h4>Atores:</h4>
                                    </b>
                                    <li>
                                        <xsl:apply-templates
                                            select="//filme[generos/genero = $g]/atores/ator"/>
                                    </li>
                                    <br/>
                                </ol>
                            </div>

                            <footer class="w3-container w3-Light-Gray">
                                <center>
                                    <br/>
                                    <button class="w3-button w3-white w3-border w3-border-black">
                                        <a href="index.html">Voltar à página principal</a>
                                    </button>
                                    <br/>
                                    <h6 style="text-shadow:1px 1px 0 #444">Gerado para
                                        EPUB2019-TP7</h6>
                                    <br/>
                                </center>
                            </footer>

                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="atores/ator" mode="pagina-individual">
        <xsl:variable name="a" select="."/>
        <xsl:result-document href="filmes-html/{$a}.html">
            <html>
                <head>
                    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
                    <title>
                        <xsl:value-of select="."/>
                    </title>
                    <meta charset="UTF-8"/>
                </head>

                <body>
                    <div class="w3-container">
                        <div class="w3-card-4">

                            <header class="w3-container w3-Blue-Gray">
                                <center>
                                    <h1 style="text-shadow:1px 1px 0 #444">
                                        <xsl:value-of select="."/>
                                    </h1>
                                </center>
                            </header>

                            <div class="w3-container">
                                <ol class="w3-ul">
                                    <br/>
                                    <b>
                                        <h4>Filmes nos quais participou:</h4>
                                    </b>
                                    <li>
                                        <xsl:apply-templates
                                            select="//filme[atores/ator = $a]/titulo"/>
                                    </li>
                                    <br/>
                                    <b>
                                        <h4>Género dos filmes nos quais participou:</h4>
                                    </b>
                                    <li>
                                        <xsl:apply-templates
                                            select="//filme[atores/ator = $a]/generos/genero"/>
                                    </li>
                                    <br/>
                                </ol>
                            </div>

                            <footer class="w3-container w3-Light-Gray">
                                <center>
                                    <br/>
                                    <button class="w3-button w3-white w3-border w3-border-black">
                                        <a href="index.html">Voltar à página principal</a>
                                    </button>
                                    <br/>
                                    <h6 style="text-shadow:1px 1px 0 #444">Gerado para
                                        EPUB2019-TP7</h6>
                                    <br/>
                                </center>
                            </footer>

                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="titulo" mode="pagina-individual">
        <xsl:variable name="t" select="."/>
        <xsl:result-document href="filmes-html/{$t}.html">
            <html>
                <head>
                    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
                    <title>
                        <xsl:value-of select="."/>
                    </title>
                    <meta charset="UTF-8"/>
                </head>

                <body>
                    <div class="w3-container">
                        <div class="w3-card-4">

                            <header class="w3-container w3-Blue-Gray">
                                <center>
                                    <h1 style="text-shadow:1px 1px 0 #444">
                                        <xsl:value-of select="."/>
                                    </h1>
                                </center>
                            </header>

                            <div class="w3-container">
                                <ol class="w3-ul">
                                    <center>
                                        <br/>
                                        <h3>Género:</h3>
                                        <li>
                                            <xsl:apply-templates
                                                select="//filme[titulo = $t]/generos"/>
                                        </li>
                                        <br/>
                                        <h3>Atores envolvidos no filme:</h3>
                                        <li>
                                            <xsl:apply-templates
                                                select="//filme[titulo = $t]/atores"/>
                                        </li>
                                        <br/>
                                    </center>
                                </ol>
                            </div>

                            <footer class="w3-container w3-Light-Gray">
                                <center>
                                    <br/>
                                    <button class="w3-button w3-white w3-border w3-border-black">
                                        <a href="index.html">Voltar à página principal</a>
                                    </button>
                                    <br/>
                                    <h6 style="text-shadow:1px 1px 0 #444">Gerado para
                                        EPUB2019-TP7</h6>
                                    <br/>
                                </center>
                            </footer>

                        </div>
                    </div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

</xsl:stylesheet>
