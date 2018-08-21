<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" indent="yes" encoding="utf-8"/>
	<xsl:template match="books">
		<ul>
		 <xsl:for-each select="book">
		   <li>
		   	<xsl:value-of select="title"/>
		   	(<i><xsl:value-of select="author"/></i>)
		   </li>
		 </xsl:for-each>
		</ul>
	</xsl:template>
</xsl:stylesheet>