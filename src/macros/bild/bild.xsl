<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- 
    <xsl:call-template name="bild">
		<xsl:with-param name="bild" select="concat(bild/@path, '/', bild/filename)" />
		<xsl:with-param name="width" select="" />
		<xsl:with-param name="height" select="" />
		<xsl:with-param name="alt" select="" />
		<xsl:with-param name="class" select="" />
		optional: <xsl:with-param name="verhaeltnis" select="'false'" />
		optional: <xsl:with-param name="lazyload" select="'true'" />
		optional: <xsl:with-param name="padding-trick" select="'true'" />
		optional: <xsl:with-param name="preload" select="'false'" />
		optional: <xsl:with-param name="hintergrundfarbe" select="'false'" />
		optional: <xsl:with-param name="bildposition" select="'5'" />
	</xsl:call-template>
    -->

	<xsl:template name="bild">
		<xsl:param name="bild" />
		<xsl:param name="width" />
		<xsl:param name="height" />
		<xsl:param name="class" />
		<xsl:param name="alt" />
		<xsl:param name="verhaeltnis" select="'false'" />
		<xsl:param name="lazyload" select="'true'" />
		<xsl:param name="padding-trick" select="'true'" />
		<xsl:param name="preload" select="'false'" />
		<xsl:param name="hintergrundfarbe" select="'false'" />
        <xsl:param name="bildposition" select="'5'" />
        
        <xsl:if test="not($bild)">
            <xsl:message terminate="yes">Utility bild: Kein Bild (bild) angegeben.</xsl:message>
        </xsl:if>
        <xsl:if test="not($width)">
            <xsl:message terminate="yes">Utility bild: Keine Bildbreite (width) angegeben.</xsl:message>
        </xsl:if>
        <xsl:if test="not($height)">
            <xsl:message terminate="yes">Utility bild: Keine Bildhöhe (height) angegeben.</xsl:message>
        </xsl:if>
        <xsl:if test="not($class)">
            <xsl:message terminate="yes">Utility bild: Keine Klasse (class) angegeben.</xsl:message>
        </xsl:if>
        <xsl:if test="not($alt)">
            <xsl:message terminate="yes">Utility bild: Kein Alt-Text (alt) angegeben.</xsl:message>
        </xsl:if>

        <xsl:variable name="lazyloadVariable">
            <xsl:choose>
                <xsl:when test="$lazyload = 'true'">lazyload</xsl:when>
                <xsl:otherwise></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="srcset">
            <xsl:choose>
                <xsl:when test="$lazyload = 'true'">data-srcset</xsl:when>
                <xsl:otherwise>srcset</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="img-height">
            <xsl:choose>
                <xsl:when test="$verhaeltnis = 'false'">
                    <xsl:value-of select="floor($height div $width * 500)" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="floor($verhaeltnis * 500)" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="bild-verhaeltnis">
            <xsl:choose>
                <xsl:when test="$verhaeltnis = 'false'">
                    <xsl:value-of select="concat(floor($height div $width * 100), '%')" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat($verhaeltnis * 100, '%')" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:choose>

            <xsl:when test="$preload = 'true'">

                <!-- Preload Bilder -->
                <!-- https://web.dev/preload-responsive-images/ -->
                <link rel="preload" href="/image/2/200/0/{$bildposition}{$bild}" as="image" media="(max-width: 200px)" />
                <link rel="preload" href="/image/2/300/0/{$bildposition}{$bild}" as="image" media="(min-width: 200.5px) and (max-width: 300px)" />
                <link rel="preload" href="/image/2/400/0/{$bildposition}{$bild}" as="image" media="(min-width: 300.5px) and (max-width: 400px)" />
                <link rel="preload" href="/image/2/600/0/{$bildposition}{$bild}" as="image" media="(min-width: 400.5px) and (max-width: 600px)" />
                <link rel="preload" href="/image/2/800/0/{$bildposition}{$bild}" as="image" media="(min-width: 600.5px) and (max-width: 800px)" />
                <link rel="preload" href="/image/2/1000/0/{$bildposition}{$bild}" as="image" media="(min-width: 800.5px) and (max-width: 1000px)" />
                <link rel="preload" href="/image/2/1200/0/{$bildposition}{$bild}" as="image" media="(min-width: 1000.5px) and (max-width: 1200px)" />
                <link rel="preload" href="/image/2/1400/0/{$bildposition}{$bild}" as="image" media="(min-width: 1200.5px) and (max-width: 1400px)" />
                <link rel="preload" href="/image/2/1600/0/{$bildposition}{$bild}" as="image" media="(min-width: 1400.5px) and (max-width: 1600px)" />
                <link rel="preload" href="/image/2/1800/0/{$bildposition}{$bild}" as="image" media="(min-width: 1600.5px) and (max-width: 1800px)" />
                <link rel="preload" href="/image/2/2000/0/{$bildposition}{$bild}" as="image" media="(min-width: 1800.5px) and (max-width: 2000px)" />
                <link rel="preload" href="/image/2/2200/0/{$bildposition}{$bild}" as="image" media="(min-width: 2000.5px) and (max-width: 2200px)" />
                <link rel="preload" href="/image/2/2400/0/{$bildposition}{$bild}" as="image" media="(min-width: 2200.5px) and (max-width: 2400px)" />
                <link rel="preload" href="/image/2/2600/0/{$bildposition}{$bild}" as="image" media="(min-width: 2400.5px) and (max-width: 2600px)" />
                <link rel="preload" href="/image/2/2800/0/{$bildposition}{$bild}" as="image" media="(min-width: 2600.5px) and (max-width: 2800px)" />
                <link rel="preload" href="/image/2/3000/0/{$bildposition}{$bild}" as="image" media="(min-width: 2800.5px) and (max-width: 3000px)" />
                <link rel="preload" href="/image/2/3200/0/{$bildposition}{$bild}" as="image" media="(min-width: 3000.5px) and (max-width: 3220px)" />
                <link rel="preload" href="/image/2/3400/0/{$bildposition}{$bild}" as="image" media="(min-width: 3220.5px) and (max-width: 3400px)" />
                <link rel="preload" href="/image/2/3600/0/{$bildposition}{$bild}" as="image" media="(min-width: 3400.5px) and (max-width: 3600px)" />
                <link rel="preload" href="/image/2/3800/0/{$bildposition}{$bild}" as="image" media="(min-width: 3600.5px)" />

            </xsl:when>

            <xsl:when test="$padding-trick = 'false'">

                <picture class="{$class}__picture">

                    <xsl:call-template name="img">

                        <xsl:with-param name="bild" select="$bild" />
                        <xsl:with-param name="width" select="$width" />
                        <xsl:with-param name="height" select="$height" />
                        <xsl:with-param name="class" select="$class" />
                        <xsl:with-param name="alt" select="$alt" />
                        <xsl:with-param name="verhaeltnis" select="$verhaeltnis" />
                        <xsl:with-param name="lazyload" select="$lazyload" />
                        <xsl:with-param name="lazyloadVariable" select="$lazyloadVariable" />
                        <xsl:with-param name="srcset" select="$srcset" />
                        <xsl:with-param name="img-height" select="$img-height" />
                        <xsl:with-param name="bild-verhaeltnis" select="$bild-verhaeltnis" />
                        <xsl:with-param name="hintergrundfarbe" select="$hintergrundfarbe" />
                        <xsl:with-param name="bildposition" select="$bildposition" />

                    </xsl:call-template>

                </picture>

            </xsl:when>

            <xsl:otherwise>

                <div class="bild-verhaeltnis">

                    <xsl:attribute name="style">
                        padding-bottom: <xsl:value-of select="$bild-verhaeltnis" />;
                        <xsl:if test="not(hintergrundfarbe = 'false')">
                            background-color: <xsl:value-of select="$hintergrundfarbe" />;
                        </xsl:if>
                    </xsl:attribute>


                    <picture>

                        <xsl:call-template name="img">

                            <xsl:with-param name="bild" select="$bild" />
                            <xsl:with-param name="width" select="$width" />
                            <xsl:with-param name="height" select="$height" />
                            <xsl:with-param name="class" select="$class" />
                            <xsl:with-param name="alt" select="$alt" />
                            <xsl:with-param name="verhaeltnis" select="$verhaeltnis" />
                            <xsl:with-param name="lazyload" select="$lazyload" />
                            <xsl:with-param name="lazyloadVariable" select="$lazyloadVariable" />
                            <xsl:with-param name="srcset" select="$srcset" />
                            <xsl:with-param name="img-height" select="$img-height" />
                            <xsl:with-param name="bild-verhaeltnis" select="$bild-verhaeltnis" />
                            <xsl:with-param name="hintergrundfarbe" select="$hintergrundfarbe" />
                            <xsl:with-param name="bildposition" select="$bildposition" />

                        </xsl:call-template>

                    </picture>

                </div>

            </xsl:otherwise>
        </xsl:choose>
        
	</xsl:template>
	
    
    <xsl:template name="img">

        <xsl:param name="bild" />
        <xsl:param name="width" />
        <xsl:param name="height" />
        <xsl:param name="class" />
        <xsl:param name="alt" />
        <xsl:param name="verhaeltnis" />
        <xsl:param name="lazyload" />
        <xsl:param name="padding-trick" />
        <xsl:param name="lazyloadVariable" />
        <xsl:param name="srcset" />
        <xsl:param name="img-height" />
        <xsl:param name="bild-verhaeltnis" />
        <xsl:param name="hintergrundfarbe" />
        <xsl:param name="bildposition" />

        <xsl:variable name="css-object-position">
            
            <xsl:if test="$bildposition = '1'">left top</xsl:if>
            <xsl:if test="$bildposition = '2'">center top</xsl:if>
            <xsl:if test="$bildposition = '3'">right top</xsl:if>
            
            <xsl:if test="$bildposition = '4'">left center</xsl:if>
            <xsl:if test="$bildposition = '5'">center center</xsl:if>
            <xsl:if test="$bildposition = '6'">right center</xsl:if>
            
            <xsl:if test="$bildposition = '7'">left bottom</xsl:if>
            <xsl:if test="$bildposition = '8'">center bottom</xsl:if>
            <xsl:if test="$bildposition = '9'">right bottom</xsl:if>
        
        </xsl:variable>

        <source type="image/webp">
            
            <xsl:attribute name="{$srcset}">
                <xsl:choose>
                    <xsl:when test="$verhaeltnis = 'false'">
                        /image/2/200/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 200w,
                        /image/2/300/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 300w,
                        /image/2/400/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 400w,
                        /image/2/600/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 600w,
                        /image/2/800/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 800w,
                        /image/2/1000/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 1000w,
                        /image/2/1200/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 1200w,
                        /image/2/1400/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 1400w,
                        /image/2/1600/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 1600w,
                        /image/2/1800/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 1800w,
                        /image/2/2000/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 2200w,
                        /image/2/2200/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 2400w,
                        /image/2/2400/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 2600w,
                        /image/2/2600/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 2000w,
                        /image/2/2800/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 2800w,
                        /image/2/3000/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 3000w,
                        /image/2/3200/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 3200w,
                        /image/2/3400/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 3400w,
                        /image/2/3600/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 3600w,
                        /image/2/3800/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 3800w
                    </xsl:when>
                    <xsl:otherwise>
                        /image/2/200/<xsl:value-of select="floor($verhaeltnis * 200)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 200w,
                        /image/2/300/<xsl:value-of select="floor($verhaeltnis * 300)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 300w,
                        /image/2/400/<xsl:value-of select="floor($verhaeltnis * 400)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 400w,
                        /image/2/600/<xsl:value-of select="floor($verhaeltnis * 600)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 600w,
                        /image/2/800/<xsl:value-of select="floor($verhaeltnis * 800)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 800w,
                        /image/2/1000/<xsl:value-of select="floor($verhaeltnis * 1000)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 1000w,
                        /image/2/1200/<xsl:value-of select="floor($verhaeltnis * 1200)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 1200w,
                        /image/2/1400/<xsl:value-of select="floor($verhaeltnis * 1400)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 1400w,
                        /image/2/1600/<xsl:value-of select="floor($verhaeltnis * 1600)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 1600w,
                        /image/2/1800/<xsl:value-of select="floor($verhaeltnis * 1800)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 1800w,
                        /image/2/2000/<xsl:value-of select="floor($verhaeltnis * 2000)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 2200w,
                        /image/2/2200/<xsl:value-of select="floor($verhaeltnis * 2200)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 2400w,
                        /image/2/2400/<xsl:value-of select="floor($verhaeltnis * 2400)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 2600w,
                        /image/2/2600/<xsl:value-of select="floor($verhaeltnis * 2600)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 2000w,
                        /image/2/2800/<xsl:value-of select="floor($verhaeltnis * 2800)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 2800w,
                        /image/2/3000/<xsl:value-of select="floor($verhaeltnis * 3000)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 3000w,
                        /image/2/3200/<xsl:value-of select="floor($verhaeltnis * 3200)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 3200w,
                        /image/2/3400/<xsl:value-of select="floor($verhaeltnis * 3400)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 3400w,
                        /image/2/3600/<xsl:value-of select="floor($verhaeltnis * 3600)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 3600w,
                        /image/2/3800/<xsl:value-of select="floor($verhaeltnis * 3800)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" />.webp 3800w
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>

        </source>


        <source type="image/jpeg">
            
            <xsl:attribute name="{$srcset}">
                <xsl:choose>
                    <xsl:when test="$verhaeltnis = 'false'">
                        /image/2/200/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 200w,
                        /image/2/300/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 300w,
                        /image/2/400/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 400w,
                        /image/2/600/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 600w,
                        /image/2/800/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 800w,
                        /image/2/1000/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 1000w,
                        /image/2/1200/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 1200w,
                        /image/2/1400/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 1400w,
                        /image/2/1600/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 1600w,
                        /image/2/1800/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 1800w,
                        /image/2/2000/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 2200w,
                        /image/2/2200/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 2400w,
                        /image/2/2400/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 2600w,
                        /image/2/2600/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 2000w,
                        /image/2/2800/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 2800w,
                        /image/2/3000/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 3000w,
                        /image/2/3200/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 3200w,
                        /image/2/3400/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 3400w,
                        /image/2/3600/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 3600w,
                        /image/2/3800/0/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 3800w
                    </xsl:when>
                    <xsl:otherwise>
                        /image/2/200/<xsl:value-of select="floor($verhaeltnis * 200)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 200w,
                        /image/2/300/<xsl:value-of select="floor($verhaeltnis * 300)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 300w,
                        /image/2/400/<xsl:value-of select="floor($verhaeltnis * 400)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 400w,
                        /image/2/600/<xsl:value-of select="floor($verhaeltnis * 600)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 600w,
                        /image/2/800/<xsl:value-of select="floor($verhaeltnis * 800)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 800w,
                        /image/2/1000/<xsl:value-of select="floor($verhaeltnis * 1000)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 1000w,
                        /image/2/1200/<xsl:value-of select="floor($verhaeltnis * 1200)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 1200w,
                        /image/2/1400/<xsl:value-of select="floor($verhaeltnis * 1400)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 1400w,
                        /image/2/1600/<xsl:value-of select="floor($verhaeltnis * 1600)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 1600w,
                        /image/2/1800/<xsl:value-of select="floor($verhaeltnis * 1800)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 1800w,
                        /image/2/2000/<xsl:value-of select="floor($verhaeltnis * 2000)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 2200w,
                        /image/2/2200/<xsl:value-of select="floor($verhaeltnis * 2200)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 2400w,
                        /image/2/2400/<xsl:value-of select="floor($verhaeltnis * 2400)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 2600w,
                        /image/2/2600/<xsl:value-of select="floor($verhaeltnis * 2600)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 2000w,
                        /image/2/2800/<xsl:value-of select="floor($verhaeltnis * 2800)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 2800w,
                        /image/2/3000/<xsl:value-of select="floor($verhaeltnis * 3000)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 3000w,
                        /image/2/3200/<xsl:value-of select="floor($verhaeltnis * 3200)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 3200w,
                        /image/2/3400/<xsl:value-of select="floor($verhaeltnis * 3400)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 3400w,
                        /image/2/3600/<xsl:value-of select="floor($verhaeltnis * 3600)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 3600w,
                        /image/2/3800/<xsl:value-of select="floor($verhaeltnis * 3800)" />/<xsl:value-of select="$bildposition" />/<xsl:value-of select="$bild" /> 3800w
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>

        </source>

        <img class="{$class}__img {$lazyloadVariable}" alt="{$alt}" width="500" height="{$img-height}" src="/image/2/200/0/{$bildposition}{$bild}" style="object-position: {$css-object-position}">
            <xsl:if test="$lazyload = 'true'">
                <xsl:attribute name="data-sizes">auto</xsl:attribute>
            </xsl:if>
        </img>
        
    </xsl:template>

</xsl:stylesheet>