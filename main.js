// main.js

// Modules to control application life and create native browser window
const { app, BrowserWindow } = require('electron');
const path = require('path');

const ip = require('ip');
const ipAddress = ip.address();
const express = require('express');
const exp = express();
const port = 3000;

exp.get('/', (req, res) => {
  win.webContents.send('asynchronous-message', {'SAVED': 'File Saved'});
  res.send('Hello World!');
});

exp.use((req, res, next) => {
  console.log(
    'info',
    `[${req.method}] - ` +
      req.protocol +
      '://' +
      req.get('host') +
      req.originalUrl
  );
  next();
});

exp.use((err, req, res, next) => {
  var unqiueErrorCode = Math.random().toString(36).substring(7);
  console.error({
    context: 'generic error',
    input: req.code,
    error: err,
    code: unqiueErrorCode,
  });
  return res.status(500)
});

exp.listen(port, () => {
  console.log(`Example exp listening on port ${port}`);
  console.log(`Network access via: ${ipAddress}:${port}!`);
});

const createWindow = () => {
  // Create the browser window.
  const mainWindow = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
      preload: path.join(__dirname, 'preload.js'),
    },
  });

  // and load the index.html of the app.
  mainWindow.loadFile('index.html');

  // Open the DevTools.
  // mainWindow.webContents.openDevTools()
};

let spawn = require('child_process').spawn;

let bat = spawn('ls', [
  // '/c', // Argument for cmd.exe to carry out the specified script
  // 'D:\test.bat', // Path to your file
  // 'argument1', // First argument
  // 'argumentN', // n-th argument
]);

bat.stdout.on('data', (data) => {
  // Handle data...
  // console.log(data.toString());
});

bat.stderr.on('data', (err) => {
  // Handle error...
});

bat.on('exit', (code) => {
  console.log({ code });
  // Handle exit
});

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Some APIs can only be used after this event occurs.
app.whenReady().then(() => {
  createWindow();

  app.on('activate', () => {
    // On macOS it's common to re-create a window in the app when the
    // dock icon is clicked and there are no other windows open.
    if (BrowserWindow.getAllWindows().length === 0) createWindow();
  });
});

// Quit when all windows are closed, except on macOS. There, it's common
// for applications and their menu bar to stay active until the user quits
// explicitly with Cmd + Q.
app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit();
});

// In this file you can include the rest of your app's specific main process
// code. You can also put them in separate files and require them here.
