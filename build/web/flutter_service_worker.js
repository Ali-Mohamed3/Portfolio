'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "7420b324a59c9bbfc171aa9f1b17b472",
"assets/AssetManifest.bin.json": "6e99063bc6366ed917a990d9d262d08a",
"assets/AssetManifest.json": "0b4355920df0512fc0c0c68449d70005",
"assets/assets/icons/approval-svgrepo-com.svg": "836b3bbe8be1e405049e334f38752a08",
"assets/assets/icons/arrow-left-svgrepo-com.svg": "543b03f1b4a834119330beb7f6088e65",
"assets/assets/icons/arrow-right-svgrepo-com.svg": "fd2a393110d8f00cb4161f9d56001bda",
"assets/assets/icons/bulb-svgrepo-com.svg": "10bec6e89e28526af63bf8f277b57e18",
"assets/assets/icons/contact-headset-communication-svgrepo-com.svg": "b6da048d8b93dc1a5e435b5f1730fee8",
"assets/assets/icons/copyright-svgrepo-com%2520(1).svg": "f7c5bc0fa42154977bd7cd1325266bb5",
"assets/assets/icons/copyright-svgrepo-com.svg": "3442d93e3779c498df38d74c3c4dbc98",
"assets/assets/icons/download-minimalistic-svgrepo-com.svg": "3d5761e0eb04062dcfb98f1011e9699b",
"assets/assets/icons/download-svgrepo-com.svg": "5c5efb5a5f3cf3963e824a71082ab046",
"assets/assets/icons/education-svgrepo-com.svg": "f09e8c73544062af6c6bf9b16c6aac08",
"assets/assets/icons/github-142-svgrepo-com.svg": "c23a95fcb4b1d25765107e4e73b06438",
"assets/assets/icons/light-bulb-idea-svgrepo-com.svg": "124fbb3c5d92774dbabeec3d5a4140c1",
"assets/assets/icons/linkedin-svgrepo-com.svg": "15cf9ebef4a8ddc72756fd6d8d2be471",
"assets/assets/icons/robot-svgrepo-com.svg": "cf355ad72ca4fd9cfcca35505a6444b1",
"assets/assets/icons/rocket-svgrepo-com.svg": "037e9e2af80565e9c838fa99e05d8889",
"assets/assets/icons/skills-svgrepo-com.svg": "9f191abc7e392b4a5666ab9472c467b3",
"assets/assets/icons/user-svgrepo-com.svg": "f12813f6f737467167150cd56dc3544c",
"assets/assets/icons/whatsapp-svgrepo-com.svg": "9b1db846caeb85b156b70b3373fe4ac2",
"assets/assets/images/image.webp": "0e639f1e989c8261b8dc608e4365767c",
"assets/assets/images/leetcode-1.webp": "62ae3f12e578cad1a3698d08eb1bd7c9",
"assets/assets/images/WhatsApp%2520Image%25202025-01-02%2520at%252023.21.27_1dd4b8e5.jpg": "e09b5c7036c1b052d9c59d70811467d6",
"assets/assets/images/WhatsApp%2520Image%25202025-09-23%2520at%252019.31.25_d56a8b92.jpg": "455513ac616d8adfdae770a2c802ad7d",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "c0e9a23f16592a9c2ddf8039cf63d1d9",
"assets/NOTICES": "cfdfe784eb1cc43846b4eeb27068ad36",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "799071b19cfd2c0994d2c143bea8d24b",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "cd80ead3768e562d8606c4ca3ae749a8",
"/": "cd80ead3768e562d8606c4ca3ae749a8",
"main.dart.js": "d4c5e7cb24e1cf3615c86f47e4672b4d",
"manifest.json": "d8fe34f7ae4c072a77b924e01dac8a50",
"version.json": "9b818ca9511483c901bed1545384376c"};
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
