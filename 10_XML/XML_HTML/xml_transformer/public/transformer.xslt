<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version='1.0' xmlns:xsl='http://www.w3.org/1999/XSL/Transform'>
	<xsl:template match='/'>
		<html>
			<head>
				<meta charset="utf-8"></meta>
			</head>
			<body>
				<div class='table'>
					<div class='row header'>
						<div class='cell'><xsl:value-of select="//text/decimal/value"/></div>
						<div class='cell'><xsl:value-of select="//text/binary/value"/></div>
					</div>
					<xsl:for-each select='//result/value/value'>
						<div class='row'>
							<div class='cell'><xsl:value-of select="value"/></div>
							<div class='cell'><xsl:value-of select="value/following-sibling::*"/></div>
						</div>
					</xsl:for-each>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>