<?xml version="1.0" encoding="UTF-8"?> 
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <xsl:apply-templates select="/Lists/List[@name='post']"/>
  </xsl:template>

  <!-- output the faciltiy code list-->
  <xsl:template match="List">
    <CodeList id="CL_POST" agencyID="ZW_MOHCW" version="1.0" isFinal="false">
      <Name xml:lang="en">Post</Name>
      <xsl:for-each select="row">
        <xsl:sort data-type="text" select="field[@column='name']"/>
        <xsl:if test="field[@column='post_id'] != ''">
          <xsl:if test="field[@column='name'] != ''">
            <Code>
              <xsl:attribute name="value">
                <xsl:value-of select="normalize-space(field[@column='post_id'])"/>
              </xsl:attribute>
              <Description>
                <xsl:value-of select="normalize-space(field[@column='name'])"/>
              </Description>
            </Code>
          </xsl:if>
        </xsl:if>
      </xsl:for-each>
    </CodeList>
  </xsl:template>

</xsl:stylesheet>



