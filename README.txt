ALERO PROPOSAL WEBSITE (Baby-blue)

Preview & Testing:
- Open index.html in a browser. The site works locally as an interactive preview.
- Without Supabase configured, answers are safely stored in localStorage for previewing.

Connecting Remote Storage (Supabase):
1. Create a Supabase project at https://supabase.com/ (free tier).
2. Open SQL Editor and run the entire contents of setup.sql.
3. In Project Settings > API, copy your Project URL and anon/public key.
4. In index.html, replace:
   PASTE_YOUR_SUPABASE_PROJECT_URL
   PASTE_YOUR_SUPABASE_ANON_KEY
   with your values.
5. Publish the folder using Netlify Drop (https://app.netlify.com/drop) or GitHub Pages / Vercel.

SECRET OWNER ADMIN PANEL:
The website contains a completely invisible, secret admin dashboard where you can read Alero's answers directly inside the site without opening Supabase!

How to Open the Secret Admin Panel:
- Method 1: Add #admin to your URL (e.g. https://your-site.netlify.app#admin).
- Method 2: Click the small blue dot in the top-left logo 5 times in a row.
- Method 3: Double-click the footer text ("crafted with intention for Alero").
- Method 4: Press Ctrl + Shift + A (or Cmd + Shift + A on Mac).

Admin Passkey:
- Default Secret PIN: 2026
- You can change this PIN anytime in index.html (look for ADMIN_SECRET_PIN) and in setup.sql.

What the Admin Panel does:
- Decrypts and shows her proposal answer ("Yes, absolutely" or "Let's talk first").
- Displays all her answered questions categorized cleanly.
- "Copy formatted text" button to copy everything to your clipboard in one tap.
- "Clear local test data" button to wipe any test submissions before sharing the link with Alero.
