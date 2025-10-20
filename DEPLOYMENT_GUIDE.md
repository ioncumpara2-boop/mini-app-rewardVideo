# 🚀 Ghid Deployment pentru Telegram Mini App

## 📋 Pasii pentru a pune aplicația online

### 1️⃣ Build aplicația (✅ DONE)
```bash
flutter build web --release
```
Fișierele sunt în: `build/web/`

### 2️⃣ Opțiuni de Hosting GRATUIT

#### **A) Vercel (Recomandat - Cel mai simplu)**

1. **Instalează Vercel CLI:**
   ```bash
   npm install -g vercel
   ```

2. **Deploy:**
   ```bash
   cd build/web
   vercel
   ```

3. **Urmează pașii:**
   - Login cu GitHub/GitLab/Email
   - Confirmă setările
   - Primești URL-ul: `https://your-app.vercel.app`

#### **B) Netlify**

1. **Metoda 1 - Drag & Drop:**
   - Mergi pe [netlify.com](https://netlify.com)
   - Drag & drop folder-ul `build/web`
   - Primești URL instant!

2. **Metoda 2 - CLI:**
   ```bash
   npm install -g netlify-cli
   cd build/web
   netlify deploy --prod
   ```

#### **C) GitHub Pages**

1. **Creează repo nou pe GitHub**

2. **Fă push la build:**
   ```bash
   cd build/web
   git init
   git add .
   git commit -m "Initial deploy"
   git branch -M gh-pages
   git remote add origin https://github.com/USERNAME/REPO.git
   git push -u origin gh-pages
   ```

3. **Activează GitHub Pages:**
   - Settings → Pages → Source: gh-pages branch
   - URL: `https://USERNAME.github.io/REPO`

#### **D) Firebase Hosting**

```bash
npm install -g firebase-tools
firebase login
firebase init hosting
# Selectează 'build/web' ca public directory
firebase deploy
```

---

### 3️⃣ Creează Telegram Bot și Mini App

1. **Creează Bot:**
   - Deschide [@BotFather](https://t.me/BotFather) în Telegram
   - Trimite `/newbot`
   - Alege un nume: `Rewards App`
   - Alege username: `YourRewardsBot`
   - Primești TOKEN (salvează-l!)

2. **Configurează Mini App:**
   - În BotFather, trimite `/newapp`
   - Selectează bot-ul tău
   - Titlu: `Rewards App`
   - Descriere: `Earn rewards by completing tasks!`
   - Upload poză (512x512 PNG)
   - Upload GIF demo (optional)
   - **Web App URL:** `https://your-app.vercel.app` (URL-ul de la pas 2)

3. **Setează comenzi (optional):**
   ```
   /mybots → @YourRewardsBot → Edit Bot → Edit Commands
   
   start - Launch Rewards App
   help - Get help
   ```

---

### 4️⃣ Testează Mini App

1. **În Telegram:**
   - Caută bot-ul tău: `@YourRewardsBot`
   - Trimite `/start`
   - Click pe butonul Web App care apare

2. **Sau direct link:**
   ```
   https://t.me/YourRewardsBot/app
   ```

---

### 5️⃣ Sharing & Distribution

#### **Inline Button (în mesaje):**
```
@BotFather → Edit Bot → Edit Menu Button
URL: https://your-app.vercel.app
Text: 🎁 Open Rewards
```

#### **Direct Link pentru Share:**
```
https://t.me/YourRewardsBot/app?startapp=ref123
```

---

## 🔧 Configurări Adiționale

### **Custom Domain (Opțional):**

1. **Cumpără domeniu** (ex: namecheap.com, godaddy.com)
2. **Pe Vercel/Netlify:**
   - Settings → Domains
   - Add custom domain: `rewards.yourdomain.com`
   - Configurează DNS records

### **Analytics:**
Adaugă în `web/index.html` înainte de `</head>`:
```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

---

## ✅ Checklist Final

- [ ] Build făcut: `flutter build web --release`
- [ ] Deploy pe hosting (Vercel/Netlify/etc)
- [ ] Bot creat în @BotFather
- [ ] Mini App configurat cu URL-ul corect
- [ ] Testat în Telegram
- [ ] (Optional) Custom domain
- [ ] (Optional) Analytics

---

## 🆘 Probleme Comune

**1. "Telegram WebApp not available"**
- Normal când rulezi local
- Funcționează doar în Telegram când e deployed

**2. "ERR_SSL_PROTOCOL_ERROR"**
- Telegram necesită HTTPS
- Toate platformele menționate oferă HTTPS gratuit

**3. Aplicația nu se încarcă:**
- Verifică URL-ul în BotFather
- Asigură-te că e HTTPS
- Check Console pentru erori (F12 în browser)

---

## 📞 Contact & Support

Pentru probleme:
1. Check logs în Vercel/Netlify dashboard
2. Verifică în Chrome DevTools (F12)
3. Test direct URL-ul în browser

**Next Steps:**
- Adaugă backend (Firebase/Supabase) pentru salvare date
- Implementează autentificare reală cu Telegram
- Adaugă notificări push
- Creează sistem de referral

---

**Quick Start Command:**
```bash
# Deploy rapid cu Vercel
cd build/web && vercel --prod
```

Succes! 🚀

