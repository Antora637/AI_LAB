<!-- db.php -->
 <?php
$conn = mysqli_connect("localhost", "root", "", "disasterPractice");
if(!$conn) die("Connection failed!");
?>


<!-- sql code -->
 CREATE DATABASE IF NOT EXISTS disasterPractice;
USE disasterPractice;

CREATE TABLE IF NOT EXISTS users (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  name       VARCHAR(100) NOT NULL,
  email      VARCHAR(150) NOT NULL UNIQUE,
  password   VARCHAR(255) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

<!-- index.php -->
 <?php
session_start();
if(!isset($_SESSION['user'])) {
    header("Location:login.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Disaster Preparedness Guide</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

<header>
  <div class="header-inner">
    <div class="header-left">
      <h1>🛡️ Disaster Preparedness Guide</h1>
      <p>Welcome, <?php echo htmlspecialchars($_SESSION['user']); ?>! &nbsp;|&nbsp; 📅 <span id="date"></span></p>
    </div>
    <a href="logout.php" class="logout-btn">🔓 Logout</a>
  </div>
</header>

<nav>
  <a href="#guides">⚠️ Guides</a>
  <a href="#shelter">🏘️ Shelter</a>
  <a href="#contacts">📞 Contacts</a>
  <a href="#checklist">✅ Checklist</a>
</nav>

<!-- GUIDES -->
<section id="guides">
  <h2>⚠️ Disaster Guides</h2>
  <div class="tabs">
    <button class="tb active" onclick="show('eq',this)">🌍 Earthquake</button>
    <button class="tb" onclick="show('fl',this)">🌊 Flood</button>
    <button class="tb" onclick="show('fi',this)">🔥 Fire</button>
    <button class="tb" onclick="show('cy',this)">🌀 Cyclone</button>
  </div>

  <div id="eq" class="tab card active">
    <div class="guide-inner">
      <img src="eq.jpg" class="guide-img" alt="Earthquake">
      <div class="guide-text">
        <h3>🌍 Earthquake</h3>
        <h4>✅ Before</h4>
        <ul><li>Secure heavy furniture</li><li>Keep emergency kit ready</li></ul>
        <h4>⚡ During</h4>
        <ul><li>Drop, Cover and Hold On</li><li>Stay away from windows</li></ul>
        <h4>🔄 After</h4>
        <ul><li>Check for gas leaks</li><li>Expect aftershocks</li></ul>
      </div>
    </div>
  </div>

  <div id="fl" class="tab card">
    <div class="guide-inner">
      <img src="fl.jpg" class="guide-img" alt="Flood">
      <div class="guide-text">
        <h3>🌊 Flood</h3>
        <h4>✅ Before</h4>
        <ul><li>Know flood risk area</li><li>Store food on upper floors</li></ul>
        <h4>⚡ During</h4>
        <ul><li>Move to higher ground</li><li>Turn off electricity</li></ul>
        <h4>🔄 After</h4>
        <ul><li>Drink boiled water only</li><li>Disinfect wet items</li></ul>
      </div>
    </div>
  </div>

  <div id="fi" class="tab card">
    <div class="guide-inner">
      <img src="fi.jpg" class="guide-img" alt="Fire">
      <div class="guide-text">
        <h3>🔥 Fire</h3>
        <h4>✅ Before</h4>
        <ul><li>Install smoke detectors</li><li>Plan escape route</li></ul>
        <h4>⚡ During</h4>
        <ul><li>Crawl low under smoke</li><li>Call fire service: 199</li></ul>
        <h4>🔄 After</h4>
        <ul><li>Don't re-enter until cleared</li><li>Seek medical help</li></ul>
      </div>
    </div>
  </div>

  <div id="cy" class="tab card">
    <div class="guide-inner">
      <img src="cy.jpg" class="guide-img" alt="Cyclone">
      <div class="guide-text">
        <h3>🌀 Cyclone</h3>
        <h4>✅ Before</h4>
        <ul><li>Know nearest shelter</li><li>Store 3-day food &amp; water</li></ul>
        <h4>⚡ During</h4>
        <ul><li>Go to cyclone shelter</li><li>Stay away from coast</li></ul>
        <h4>🔄 After</h4>
        <ul><li>Watch for power lines</li><li>Avoid floodwater</li></ul>
      </div>
    </div>
  </div>
</section>

<!-- SHELTER -->
<section id="shelter">
  <h2>🏘️ Shelter Locator — Pabna District</h2>
  <div class="shelter-box">
    <p class="shelter-hint">Select your upazila to find the nearest emergency shelters.</p>
    <div class="search-row">
      <select id="upazilaSelect">
        <option value="">-- Select Upazila --</option>
        <option value="Pabna Sadar">Pabna Sadar</option>
        <option value="Ishwardi">Ishwardi</option>
        <option value="Bera">Bera</option>
      </select>
      <button onclick="searchShelter()">🔍 Find Shelter</button>
    </div>
    <div id="shelterResult"></div>
  </div>
</section>

<!-- CONTACTS -->
<section id="contacts">
  <h2>📞 Emergency Contacts</h2>
  <div class="cgrid">
    <div class="cc">
      <div class="ic">🚨</div>
      <h4>National Emergency</h4>
      <div class="num">999</div>
      <p>Police, Fire &amp; Ambulance</p>
    </div>
    <div class="cc">
      <div class="ic">🚒</div>
      <h4>Fire Service</h4>
      <div class="num">199</div>
      <p>Fire &amp; Civil Defense</p>
    </div>
    <div class="cc">
      <div class="ic">🚑</div>
      <h4>Ambulance</h4>
      <div class="num">1990</div>
      <p>Emergency Medical</p>
    </div>
    <div class="cc">
      <div class="ic">👮</div>
      <h4>Police</h4>
      <div class="num">100</div>
      <p>Bangladesh Police</p>
    </div>
    <div class="cc">
      <div class="ic">🌊</div>
      <h4>Flood Warning</h4>
      <div class="num">1090</div>
      <p>Flood Forecasting</p>
    </div>
    <div class="cc">
      <div class="ic">🏥</div>
      <h4>Health Hotline</h4>
      <div class="num">16400</div>
      <p>DGHS Emergency</p>
    </div>
    <div class="cc">
      <div class="ic">🧒</div>
      <h4>Child Helpline</h4>
      <div class="num">1098</div>
      <p>Child Protection</p>
    </div>
    <div class="cc">
      <div class="ic">👩</div>
      <h4>Women Helpline</h4>
      <div class="num">10921</div>
      <p>Women Support</p>
    </div>
    <div class="cc">
      <div class="ic">🛡️</div>
      <h4>DDM Helpline</h4>
      <div class="num">10941</div>
      <p>Disaster Management</p>
    </div>
  </div>
</section>

<!-- CHECKLIST -->
<section id="checklist">
  <h2>✅ Emergency Checklist</h2>
  <div class="card">
    <div class="pi">
      <span id="pt">0 of 10</span>
      <span id="pp">0%</span>
    </div>
    <div class="pb">
      <div class="pf" id="pb"></div>
    </div>
    <div class="list" id="list"></div>
    <button class="btn reset-btn" onclick="reset()">🔄 Reset</button>
  </div>
</section>

<footer>🛡️ Disaster Preparedness Guide | Emergency: <strong>999</strong></footer>

<script src="script.js"></script>
</body>
</html>

<!-- login.php -->
 <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login - Disaster Guide</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

<header>
  <div class="header-inner">
    <div class="header-left">
      <h1>🛡️ Disaster Preparedness Guide</h1>
      <p>Login to access the guide</p>
    </div>
  </div>
</header>

<?php
session_start();
include 'db.php';
if(isset($_SESSION['user'])) { header("Location:index.php"); exit; }
$msg = '';
if($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $res   = mysqli_query($conn, "SELECT * FROM users WHERE email='$email'");
    $user  = mysqli_fetch_assoc($res);
    if($user && password_verify($_POST['password'], $user['password'])) {
        $_SESSION['user'] = $user['name'];
        header("Location:index.php"); exit;
    } else {
        $msg = '<div class="msg err">❌ Wrong email or password!</div>';
    }
}
echo $msg;
?>

<div class="box">
  <h2>🔒 Login</h2>
  <div class="card">
    <form method="POST">
      <label>Email</label>
      <input type="email" name="email" placeholder="you@email.com" required>
      <label>Password</label>
      <input type="password" name="password" placeholder="Your password" required>
      <button type="submit" class="btn full-btn">🔒 Login</button>
    </form>
    <div class="lnk">No account? <a href="register.php">Register here</a></div>
  </div>
</div>

<footer>🛡️ Disaster Guide | Emergency: <strong>999</strong></footer>
</body>
</html>

<!-- logout.php -->
 <?php
session_start();
session_destroy();
header("Location:login.php");
exit;
?>

<!-- register.php -->
 <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register - Disaster Guide</title>
<link rel="stylesheet" href="style.css">
</head>
<body>

<header>
  <div class="header-inner">
    <div class="header-left">
      <h1>🛡️ Disaster Preparedness Guide</h1>
      <p>Create your account</p>
    </div>
  </div>
</header>

<?php
include 'db.php';
$msg = '';
if($_SERVER['REQUEST_METHOD'] == 'POST') {
    $name  = mysqli_real_escape_string($conn, $_POST['name']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $pass  = password_hash($_POST['password'], PASSWORD_DEFAULT);
    $chk   = mysqli_query($conn, "SELECT id FROM users WHERE email='$email'");
    if(mysqli_num_rows($chk) > 0) {
        $msg = '<div class="msg err">❌ Email already registered!</div>';
    } else {
        mysqli_query($conn, "INSERT INTO users(name,email,password) VALUES('$name','$email','$pass')");
        $msg = '<div class="msg suc">✅ Done! <a href="login.php">Login now</a></div>';
    }
}
echo $msg;
?>

<div class="box">
  <h2>📝 Create Account</h2>
  <div class="card">
    <form method="POST">
      <label>Full Name</label>
      <input type="text" name="name" placeholder="Your name" required>
      <label>Email</label>
      <input type="email" name="email" placeholder="you@email.com" required>
      <label>Password</label>
      <input type="password" name="password" placeholder="Min 6 characters" required>
      <button type="submit" class="btn full-btn">📝 Register</button>
    </form>
    <div class="lnk">Have account? <a href="login.php">Login here</a></div>
  </div>
</div>

<footer>🛡️ Disaster Guide | Emergency: <strong>999</strong></footer>
</body>
</html>

<!-- script.js -->
 // DATE
document.getElementById('date').textContent = new Date().toLocaleString();

// TABS
function show(id, btn) {
    document.querySelectorAll('.tab').forEach(t => t.classList.remove('active'));
    document.querySelectorAll('.tb').forEach(b => b.classList.remove('active'));
    document.getElementById(id).classList.add('active');
    btn.classList.add('active');
}

// SHELTER
var shelters = {
    "Pabna Sadar": ["Pabna Government College (500 people)", "Pabna Zilla School (400 people)", "Government Edward College (450 people)"],
    "Ishwardi":    ["Ishwardi Government College (600 people)", "Ishwardi Pilot High School (350 people)"],
    "Bera":        ["Bera Degree College (450 people)", "Bera Government High School (300 people)"]
};

function searchShelter() {
    var u = document.getElementById('upazilaSelect').value;
    var div = document.getElementById('shelterResult');
    if(!u) { div.innerHTML = '<div class="no-result">Please select an upazila first.</div>'; return; }
    var html = '<p class="shelter-found">📍 ' + shelters[u].length + ' shelters found in ' + u + '</p><ul>';
    shelters[u].forEach(function(s) { html += '<li>' + s + '</li>'; });
    div.innerHTML = html + '</ul>';
}

// CHECKLIST
var items = [
    "💧 Drinking water",
    "🍱 Non-perishable food",
    "🩹 First aid kit",
    "🔦 Flashlight",
    "📻 Battery radio",
    "😷 Dust masks",
    "💊 Medicines",
    "🧴 Sanitizer",
    "💰 Emergency cash",
    "📓 Contact list"
];
var s = JSON.parse(localStorage.getItem('cl') || '{}');

function render() {
    var el = document.getElementById('list');
    el.innerHTML = '';
    items.forEach(function(item, i) {
        var d = document.createElement('div');
        d.className = 'ci' + (s[i] ? ' done' : '');
        d.innerHTML = '<input type="checkbox" id="c' + i + '" ' + (s[i] ? 'checked' : '') + '>' +
                      '<label for="c' + i + '">' + item + '</label>';
        d.querySelector('input').onchange = function() {
            s[i] = !s[i];
            localStorage.setItem('cl', JSON.stringify(s));
            render();
        };
        el.appendChild(d);
    });
    var n = Object.values(s).filter(Boolean).length;
    var p = Math.round(n / items.length * 100);
    document.getElementById('pt').textContent = n + ' of ' + items.length;
    document.getElementById('pp').textContent = p + '%';
    document.getElementById('pb').style.width = p + '%';
}

function reset() {
    if(confirm('Reset checklist?')) {
        localStorage.removeItem('cl');
        Object.keys(s).forEach(function(k) { delete s[k]; });
        render();
    }
}

render();


<!-- style.css -->
 * { margin: 0; padding: 0; box-sizing: border-box; }

body {
    font-family: Arial, sans-serif;
    background: #f0f8f9;
    color: #1a2e33;
}

/* HEADER */
header {
    background: linear-gradient(135deg, #0d3d47, #1a7f8e);
    color: #fff;
    padding: 40px 30px;
}
.header-inner {
    max-width: 900px;
    margin: 0 auto;
    display: flex;
    align-items: center;
    justify-content: space-between;
}
.header-left h1 { font-size: 1.6rem; margin-bottom: 4px; }
.header-left p { font-size: 0.82rem; opacity: 0.85; }
.logout-btn {
    background: #f0a500;
    color: #fff;
    text-decoration: none;
    padding: 8px 18px;
    border-radius: 8px;
    font-size: 0.88rem;
    font-weight: 600;
    white-space: nowrap;
}
.logout-btn:hover { background: #d4920a; }

/* NAV */
nav {
    background: #0d3d47;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    position: sticky;
    top: 0;
    z-index: 99;
}
nav a {
    color: rgba(255,255,255,0.8);
    text-decoration: none;
    padding: 11px 15px;
    font-size: 0.88rem;
    border-bottom: 3px solid transparent;
}
nav a:hover { color: #f0a500; border-bottom-color: #f0a500; }

/* SECTION */
section { max-width: 900px; margin: 40px auto; padding: 0 20px; }
h2 { font-size: 1.3rem; color: #0d3d47; border-bottom: 3px solid #1a7f8e; padding-bottom: 8px; margin-bottom: 20px; }
h3 { color: #1a7f8e; margin-bottom: 10px; }
h4 { color: #1a7f8e; margin: 10px 0 5px; }
ul { padding-left: 18px; }
li { font-size: 0.88rem; margin-bottom: 4px; }

/* CARD */
.card {
    background: #fff;
    border-radius: 12px;
    padding: 22px;
    box-shadow: 0 4px 15px rgba(26,127,142,0.1);
    margin-bottom: 18px;
}

/* BUTTON */
.btn {
    background: #1a7f8e;
    color: #fff;
    border: none;
    padding: 10px 22px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 0.9rem;
    font-weight: 600;
}
.btn:hover { background: #0d3d47; }
.reset-btn { background: #e74c3c; margin-top: 14px; }
.reset-btn:hover { background: #c0392b; }

/* TABS */
.tabs { display: flex; gap: 8px; flex-wrap: wrap; margin-bottom: 16px; }
.tb {
    padding: 8px 16px;
    border: 2px solid #1a7f8e;
    background: #fff;
    color: #1a7f8e;
    border-radius: 8px;
    cursor: pointer;
    font-weight: 600;
}
.tb.active, .tb:hover { background: #1a7f8e; color: #fff; }
.tab { display: none; }
.tab.active { display: block; }

/* GUIDE IMAGE */
.guide-inner {
    display: flex;
    flex-direction: row-reverse;
    gap: 20px;
    align-items: flex-start;
}
.guide-img {
    width: 300px;
    height: 220px;
    object-fit: cover;
    border-radius: 10px;
    flex-shrink: 0;
}
.guide-text { flex: 1; }
@media(max-width: 600px) {
    .guide-inner { flex-direction: column; }
    .guide-img { width: 100%; height: 180px; }
}

/* CONTACT GRID */
.cgrid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
    gap: 12px;
}
.cc {
    background: #fff;
    border-radius: 12px;
    padding: 16px;
    text-align: center;
    box-shadow: 0 4px 12px rgba(26,127,142,0.1);
    border-left: 5px solid #f0a500;
}
.cc .ic { font-size: 1.8rem; margin-bottom: 6px; }
.cc h4 { font-size: 0.86rem; color: #0d3d47; }
.cc .num { font-size: 1.4rem; font-weight: 700; color: #1a7f8e; margin: 4px 0; }
.cc p { font-size: 0.74rem; color: #6a8a90; }

/* SHELTER */
.shelter-box {
    background: #fff;
    border-radius: 12px;
    padding: 22px;
    box-shadow: 0 4px 15px rgba(26,127,142,0.1);
}
.shelter-hint { font-size: 0.88rem; color: #5a7a80; margin-bottom: 16px; }
.search-row { display: flex; gap: 10px; margin-bottom: 20px; flex-wrap: wrap; }
.search-row select {
    flex: 1;
    padding: 10px 14px;
    border: 2px solid #e0f4f7;
    border-radius: 8px;
    font-size: 0.9rem;
    outline: none;
    min-width: 180px;
}
.search-row select:focus { border-color: #1a7f8e; }
.search-row button {
    background: #1a7f8e;
    color: #fff;
    border: none;
    padding: 10px 22px;
    border-radius: 8px;
    cursor: pointer;
    font-weight: 600;
    font-size: 0.9rem;
}
.search-row button:hover { background: #0d3d47; }
.no-result { text-align: center; color: #999; padding: 30px; font-size: 0.9rem; }
.shelter-found { font-size: 0.85rem; color: #1a7f8e; font-weight: 600; margin-bottom: 12px; }

/* CHECKLIST */
.pi { display: flex; justify-content: space-between; font-size: 0.88rem; font-weight: 600; color: #1a7f8e; margin-bottom: 5px; }
.pb { background: #e0f4f7; border-radius: 50px; height: 14px; margin-bottom: 16px; overflow: hidden; }
.pf { height: 100%; background: linear-gradient(90deg, #1a7f8e, #2aabb8); border-radius: 50px; transition: 0.4s; width: 0%; }
.list { display: grid; grid-template-columns: repeat(auto-fit, minmax(190px, 1fr)); gap: 8px; }
.ci {
    display: flex;
    align-items: center;
    gap: 8px;
    padding: 9px 12px;
    background: #f0f8f9;
    border-radius: 8px;
    border: 2px solid transparent;
}
.ci.done { background: #d4f5f0; border-color: #2aabb8; }
.ci.done label { text-decoration: line-through; color: #7aaa9a; }
.ci input { width: 17px; height: 17px; accent-color: #1a7f8e; cursor: pointer; }
.ci label { cursor: pointer; font-size: 0.87rem; font-weight: normal; display: inline; margin-bottom: 0; }

/* FORM */
.box { max-width: 400px; margin: 40px auto; padding: 0 20px; }
.box h2 { text-align: center; margin-bottom: 20px; color: #0d3d47; border: none; }
.msg { padding: 10px; border-radius: 8px; margin-bottom: 12px; font-size: 0.9rem; }
.err { background: #fde8e8; color: #c0392b; }
.suc { background: #d4f5e9; color: #1a7a50; }
.suc a { color: #1a7f8e; font-weight: 600; text-decoration: none; }
.lnk { text-align: center; margin-top: 12px; font-size: 0.88rem; }
.lnk a { color: #1a7f8e; font-weight: 600; text-decoration: none; }
label { font-size: 0.88rem; font-weight: 600; color: #0d3d47; display: block; margin-bottom: 4px; }
input[type="text"], input[type="email"], input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 2px solid #e0f4f7;
    border-radius: 8px;
    margin-bottom: 12px;
    outline: none;
    font-size: 0.9rem;
}
input:focus { border-color: #1a7f8e; }
.full-btn { width: 100%; margin-top: 4px; }

/* FOOTER */
footer {
    background: #0d3d47;
    color: rgba(255,255,255,0.7);
    text-align: center;
    padding: 16px;
    margin-top: 40px;
    font-size: 0.85rem;
}
