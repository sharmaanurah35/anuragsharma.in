#!/bin/bash
# Rebuild index.html from sections + external stylesheet
# Run this whenever you edit any section file

cd "$(dirname "$0")"

cat > index.html << 'HEAD_EOF'
<!DOCTYPE html>
<!-- Portfolio v6.1 · Built 2026-05-11 20:04 · NO AVIATION IMAGES -->
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Anurag Sharma — Digital Marketing</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="styles.css">
</head>
<body>
HEAD_EOF

# Nav (outside wrap)
cat sections/nav.html >> index.html
echo "" >> index.html
echo '<div class="wrap">' >> index.html

# Sections in order
for f in hero toolkit services social-media feed-design meta-ads seo why-me contact; do
  cat "sections/$f.html" >> index.html
  echo "" >> index.html
done

# Footer + close
cat sections/footer.html >> index.html
echo "</div>" >> index.html
echo "</body>" >> index.html
echo "</html>" >> index.html

echo "✓ Built index.html ($(wc -l < index.html) lines)"
