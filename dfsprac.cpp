* { margin: 0; padding: 0; box-sizing: border-box; }

body {
    font-family: Arial, sans-serif;
    background: rgb(240,248,249);
    color: rgb(26,46,51);
}

/* HEADER */
header {
    background: linear-gradient(135deg, rgb(13,61,71), rgb(26,127,142));
    color: rgb(255,255,255);
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
    background: rgb(240,165,0);
    color: rgb(255,255,255);
    text-decoration: none;
    padding: 8px 18px;
    border-radius: 8px;
    font-size: 0.88rem;
    font-weight: 600;
    white-space: nowrap;
}
.logout-btn:hover { background: rgb(212,146,10); }

/* NAV */
nav {
    background: rgb(13,61,71);
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
nav a:hover { color: rgb(240,165,0); border-bottom-color: rgb(240,165,0); }

/* SECTION */
section { max-width: 900px; margin: 40px auto; padding: 0 20px; }
h2 { font-size: 1.3rem; color: rgb(13,61,71); border-bottom: 3px solid rgb(26,127,142); padding-bottom: 8px; margin-bottom: 20px; }
h3 { color: rgb(26,127,142); margin-bottom: 10px; }
h4 { color: rgb(26,127,142); margin: 10px 0 5px; }
ul { padding-left: 18px; }
li { font-size: 0.88rem; margin-bottom: 4px; }

/* CARD */
.card {
    background: rgb(255,255,255);
    border-radius: 12px;
    padding: 22px;
    box-shadow: 0 4px 15px rgba(26,127,142,0.1);
    margin-bottom: 18px;
}

/* BUTTON */
.btn {
    background: rgb(26,127,142);
    color: rgb(255,255,255);
    border: none;
    padding: 10px 22px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 0.9rem;
    font-weight: 600;
}
.btn:hover { background: rgb(13,61,71); }
.reset-btn { background: rgb(231,76,60); margin-top: 14px; }
.reset-btn:hover { background: rgb(192,57,43); }

/* TABS */
.tabs { display: flex; gap: 8px; flex-wrap: wrap; margin-bottom: 16px; }
.tb {
    padding: 8px 16px;
    border: 2px solid rgb(26,127,142);
    background: rgb(255,255,255);
    color: rgb(26,127,142);
    border-radius: 8px;
    cursor: pointer;
    font-weight: 600;
}
.tb.active, .tb:hover { background: rgb(26,127,142); color: rgb(255,255,255); }
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
    background: rgb(255,255,255);
    border-radius: 12px;
    padding: 16px;
    text-align: center;
    box-shadow: 0 4px 12px rgba(26,127,142,0.1);
    border-left: 5px solid rgb(240,165,0);
}
.cc .ic { font-size: 1.8rem; margin-bottom: 6px; }
.cc h4 { font-size: 0.86rem; color: rgb(13,61,71); }
.cc .num { font-size: 1.4rem; font-weight: 700; color: rgb(26,127,142); margin: 4px 0; }
.cc p { font-size: 0.74rem; color: rgb(106,138,144); }

/* SHELTER */
.shelter-box {
    background: rgb(255,255,255);
    border-radius: 12px;
    padding: 22px;
    box-shadow: 0 4px 15px rgba(26,127,142,0.1);
}
.shelter-hint { font-size: 0.88rem; color: rgb(90,122,128); margin-bottom: 16px; }
.search-row { display: flex; gap: 10px; margin-bottom: 20px; flex-wrap: wrap; }
.search-row select {
    flex: 1;
    padding: 10px 14px;
    border: 2px solid rgb(224,244,247);
    border-radius: 8px;
    font-size: 0.9rem;
    outline: none;
    min-width: 180px;
}
.search-row select:focus { border-color: rgb(26,127,142); }
.search-row button {
    background: rgb(26,127,142);
    color: rgb(255,255,255);
    border: none;
    padding: 10px 22px;
    border-radius: 8px;
    cursor: pointer;
    font-weight: 600;
    font-size: 0.9rem;
}
.search-row button:hover { background: rgb(13,61,71); }
.no-result { text-align: center; color: rgb(153,153,153); padding: 30px; font-size: 0.9rem; }
.shelter-found { font-size: 0.85rem; color: rgb(26,127,142); font-weight: 600; margin-bottom: 12px; }

/* CHECKLIST */
.pi { display: flex; justify-content: space-between; font-size: 0.88rem; font-weight: 600; color: rgb(26,127,142); margin-bottom: 5px; }
.pb { background: rgb(224,244,247); border-radius: 50px; height: 14px; margin-bottom: 16px; overflow: hidden; }
.pf { height: 100%; background: linear-gradient(90deg, rgb(26,127,142), rgb(42,171,184)); border-radius: 50px; transition: 0.4s; width: 0%; }
.list { display: grid; grid-template-columns: repeat(auto-fit, minmax(190px, 1fr)); gap: 8px; }
.ci {
    display: flex;
    align-items: center;
    gap: 8px;
    padding: 9px 12px;
    background: rgb(240,248,249);
    border-radius: 8px;
    border: 2px solid transparent;
}
.ci.done { background: rgb(212,245,240); border-color: rgb(42,171,184); }
.ci.done label { text-decoration: line-through; color: rgb(122,170,154); }
.ci input { width: 17px; height: 17px; accent-color: rgb(26,127,142); cursor: pointer; }
.ci label { cursor: pointer; font-size: 0.87rem; font-weight: normal; display: inline; margin-bottom: 0; }

/* FORM */
.box { max-width: 400px; margin: 40px auto; padding: 0 20px; }
.box h2 { text-align: center; margin-bottom: 20px; color: rgb(13,61,71); border: none; }
.msg { padding: 10px; border-radius: 8px; margin-bottom: 12px; font-size: 0.9rem; }
.err { background: rgb(253,232,232); color: rgb(192,57,43); }
.suc { background: rgb(212,245,233); color: rgb(26,122,80); }
.suc a { color: rgb(26,127,142); font-weight: 600; text-decoration: none; }
.lnk { text-align: center; margin-top: 12px; font-size: 0.88rem; }
.lnk a { color: rgb(26,127,142); font-weight: 600; text-decoration: none; }
label { font-size: 0.88rem; font-weight: 600; color: rgb(13,61,71); display: block; margin-bottom: 4px; }
input[type="text"], input[type="email"], input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 2px solid rgb(224,244,247);
    border-radius: 8px;
    margin-bottom: 12px;
    outline: none;
    font-size: 0.9rem;
}
input:focus { border-color: rgb(26,127,142); }
.full-btn { width: 100%; margin-top: 4px; }

/* FOOTER */
footer {
    background: rgb(13,61,71);
    color: rgba(255,255,255,0.7);
    text-align: center;
    padding: 16px;
    margin-top: 40px;
    font-size: 0.85rem;
}