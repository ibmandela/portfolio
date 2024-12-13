'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".dart_tool/dartpad/web_plugin_registrant.dart": "7ed35bc85b7658d113371ffc24d07117",
".dart_tool/extension_discovery/vs_code.json": "5cc1051b7a9978f7d6551dd51db768cb",
".dart_tool/package_config.json": "cdf4a295ad477eb212467aa6486c6fe6",
".dart_tool/package_config_subset": "4d73cc871f3dd572ae06e8f6d2294bbd",
".dart_tool/version": "2841ffeadb09869efc7824fcfeb31bd6",
".idea/libraries/Dart_SDK.xml": "45cf449e39d18076afa85358b2a2aa38",
".idea/libraries/KotlinJavaRuntime.xml": "de38cfadca3106f8aff5ab15dd81692f",
".idea/modules.xml": "65a78f67f558ff44d25fe766dae75bb5",
".idea/runConfigurations/main_dart.xml": "0ecf958af289efc3fc1927aa27a8442f",
".idea/workspace.xml": "25155dfb2368a7e35e1ebbecd505a418",
"analysis_options.yaml": "9e65f4b9beebb674c0dc252f70a5c177",
"assets/AssetManifest.bin": "6acf27dfa21f797160319b78e7308783",
"assets/AssetManifest.bin.json": "ca8e09fcaec809fcbd66d193c7b4b064",
"assets/AssetManifest.json": "2b317447736680d96061de9cfe9c5882",
"assets/assets/admin_app.gif": "c7b88523b0a6a039162893ca95ac2705",
"assets/assets/android.png": "cbc640db105311b98b0483253c13bc21",
"assets/assets/angular.png": "05e3c86a81d9cde968db73b429a5b02c",
"assets/assets/aws.png": "d2c7a7afd51f1c276d18f5428ed26084",
"assets/assets/bnp.gif": "6656f5b6824908a0d8eda84c47f1103d",
"assets/assets/bpce.gif": "852b862a93fcb0623a6173854223ef22",
"assets/assets/chat_app.gif": "64ebc58b50c55f254898651731267c8d",
"assets/assets/client.png": "892212ba4b08eb271bc99e56dc8574fb",
"assets/assets/commerce_app.gif": "a35faa1933227401741a0a800585da8e",
"assets/assets/computer.png": "825133304a36bfd50c211fb8b00066f7",
"assets/assets/contact.png": "8f4207c8b82e152f89525ddfcc9b49ec",
"assets/assets/c_sharp.png": "7f8b9416b112d14a83f0b920a9db2fde",
"assets/assets/dart.png": "049586667b0935cbf762fae5b402952f",
"assets/assets/facture.png": "b1798d2a918969b57d3ed906311f69da",
"assets/assets/firebase.png": "de1546f8bcc43f9252f70ff7509e468b",
"assets/assets/flutter.png": "442f3d574fbf93f9e3cff5703f35a1bd",
"assets/assets/gestion.png": "3522f4301a64d4f2a495fdf37354f641",
"assets/assets/github.png": "35e0cf605050045cda57a281d0a784d8",
"assets/assets/iphone.png": "9bff8e61fcadbdc46b013bac08832b83",
"assets/assets/javascript.png": "9824ac73aa084ed4b7a07a0051dd6102",
"assets/assets/kotlin.png": "49ace488534137a883d1b67f7557a3db",
"assets/assets/linkedin.png": "a2007e68dd1206eda5ab27d9ba5e7708",
"assets/assets/node_js.png": "cf5697d25b3d6170a5ef9ae75a14aaba",
"assets/assets/noSql.png": "094969fb591d9ab29c32ca606306f0ad",
"assets/assets/photo.png": "1f4eec793dd41786324593a105c85270",
"assets/assets/portfolio-angular.gif": "b83e823721f6a34ba8cb5a52c258ec30",
"assets/assets/portfolio-flutter.gif": "f8f1a2613fba12c1102a22a59a935c92",
"assets/assets/portfolio.png": "2a784eaef668e7b41d737136ea287720",
"assets/assets/react_js.png": "6111133488a0649ed2aeaf292ca071c2",
"assets/assets/samy.gif": "2f65036b9e5c6154624574c1c1e9120a",
"assets/assets/skills.png": "2ea4b80d4f4ac3fe0e9d2de9f240199b",
"assets/assets/sql.png": "26f89362ecfc0fd9c9075e227c22b749",
"assets/assets/sql_lite.png": "9ce9f8df7569865de04a30c42294c56e",
"assets/assets/sql_serveur.png": "861603521e32a252805cfe18ddbaa448",
"assets/assets/statistique.png": "f13c911b6c57a31f51d39129c0b3ec7d",
"assets/assets/stock.png": "576790d09923d523960584d999d4e4d7",
"assets/assets/store.png": "b3c9aa57a2238c7c672e16d393dc9154",
"assets/assets/suivie.png": "ccc14882704f01daa334c675d8e9f373",
"assets/assets/tablet.png": "e6aec9b7dd83c0d987451b81b90858c9",
"assets/assets/ticket.png": "f874435cf257aed73591a8c1b0b456f4",
"assets/assets/typescript.png": "c18b54f5924a8aa73dd577449f05b040",
"assets/assets/vba.png": "5ab742fb5acd0f80202494e8d424f9c2",
"assets/assets/vente.png": "9e0e14b005132326fbe1c0ac391aa5f6",
"assets/assets/waving.png": "8086eaa179176210a4dcb62a4692e258",
"assets/assets/whatsapp.png": "3c5a08a99e5be5c20eb5a99ea9492407",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "1933b6f6b006a80e720bb0c5d9af3378",
"assets/NOTICES": "8886e6c6beb3f4bcb4a33fa9b9d44886",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "c1683e6b51eb261df6eb0d9a352aaf0b",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "1504c788a46a985b387d4341c66a3b52",
"icons/Icon-192.png": "9aefb2cef553b5fd011725c24910004d",
"icons/Icon-512.png": "3dd00e99ca9bd6838ac066587b3107da",
"icons/Icon-maskable-192.png": "9aefb2cef553b5fd011725c24910004d",
"icons/Icon-maskable-512.png": "3dd00e99ca9bd6838ac066587b3107da",
"index.html": "4dc988970f64e464030b73f9b1a19938",
"/": "4dc988970f64e464030b73f9b1a19938",
"lib/main.dart": "d8621d84413b0f1b1eeb5df51af935a1",
"main.dart.js": "d9088ec906e54d90eef79eb2c84bd30e",
"manifest.json": "306f0bb308b7438bd39a44cbf3c154d3",
"portfolio_9c78e.iml": "f9bf5c490675c84d098e6772a6f2a796",
"pubspec.lock": "fd9152d87bd39a9009389dca41babd78",
"pubspec.yaml": "3f0e347d9e894e0e3ed385962c0629a5",
"README.md": "e00c50b12786224e4c70edf7c9d0e047",
"test/widget_test.dart": "b7ec07fbb1ae9f5dcfd57d2ea47f7f66",
"version.json": "ca86be704e88e7dd29f7dc6d903045ec",
"web/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"web/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"web/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"web/icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"web/icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"web/index.html": "4804037848aa8fc9f484a30def7aade3",
"web/manifest.json": "6dfc69f0c602941229787be64a22feae"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
