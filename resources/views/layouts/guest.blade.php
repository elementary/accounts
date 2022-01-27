<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}" class="min-h-screen">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>elementary Accounts</title>
        <meta property="og:title" content="elementary Accounts">
        <meta itemprop="name" content="elementary Accounts">
        <meta name="twitter:title" content="elementary Accounts">

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="icon" sizes="256x256" href="https://www.gravatar.com/avatar/eaa3cc978770998ea2bd4382935bf0f4?s=256&amp;d=blank">
        <meta itemprop="logo" content="https://www.gravatar.com/avatar/eaa3cc978770998ea2bd4382935bf0f4?s=256&amp;d=blank">
        <link rel="shortcut icon" href="https://elementary.io/favicon.ico">
        <link rel="apple-touch-icon" href="https://elementary.io/images/launcher-icons/apple-touch-icon.png">

        <meta name="theme-color" content="#64baff">
        <meta name="color-scheme" content="light dark">

        <meta name="twitter:card" content="summary">
        <meta property="twitter:image" content="https://www.gravatar.com/avatar/eaa3cc978770998ea2bd4382935bf0f4?s=256&amp;d=blank">

        <meta name="twitter:site" content="@elementary">
        <meta name="twitter:creator" content="@elementary">

        <meta name="description" content="We design and develop the fast, open, and privacy-respecting replacement for Windows and macOS">
        <meta property="og:description" content="We design and develop the fast, open, and privacy-respecting replacement for Windows and macOS">
        <meta itemprop="description" content="We design and develop the fast, open, and privacy-respecting replacement for Windows and macOS">
        <meta name="twitter:description" content="We design and develop the fast, open, and privacy-respecting replacement for Windows and macOS">

        <link rel="stylesheet" type="text/css" media="all" href="{{ mix('css/app.css') }}">

        <script src="{{ mix('js/app.js') }}" defer></script>
    </head>

    <body class="font-ui bg-white text-black-500 dark:bg-black-700 dark:text-silver-300 min-h-screen flex flex-col">
      <header class="bg-lime-500 text-[17px] flex-0">
        <nav class="flex justify-between overflow-x-auto px-4 h-12 whitespace-nowrap">
          <ul class="flex-0 flex items-center">
            <li class="inline-flex list-none">
              <a href="https://elementary.io" target="_self" class="inline-block text-silver-100 px-[0.65rem]">
                <svg xmlns="http://www.w3.org/2000/svg" height="22" width="22"><path d="M11 0C4.926 0 0 4.926 0 11s4.926 11 11 11 11-4.926 11-11S17.074 0 11 0zm-.02 1.049h.002a.07.07 0 0 0 .018 0c4.548 0 8.384 3.052 9.57 7.217a17.315 17.315 0 0 1-4.213 5.496c-.847.733-1.773 1.383-2.79 1.842-1.018.458-2.136.719-3.247.656a5.6 5.6 0 0 1-2.271-.633 18.276 18.276 0 0 0 5.078-4.12c.956-1.116 1.791-2.39 2.115-3.833.165-.722.19-1.48.04-2.207a4.079 4.079 0 0 0-.999-1.965 4.013 4.013 0 0 0-1.855-1.098 4.85 4.85 0 0 0-2.153-.078c-1.423.261-2.693 1.086-3.705 2.108-1.787 1.8-2.89 4.34-2.687 6.875.102 1.267.524 2.511 1.252 3.554.143.205.302.398.467.584a16.228 16.228 0 0 1-3.086.739A9.946 9.946 0 0 1 10.98 1.049zm.07 2.02c.004-.001.016.002.012.001.692 0 1.387.211 1.936.627a3.2 3.2 0 0 1 1.068 1.49 4.12 4.12 0 0 1 .192 1.848c-.143 1.243-.77 2.388-1.533 3.393-1.354 1.778-3.156 3.203-5.159 4.2-.19.095-.386.187-.582.274a5.114 5.114 0 0 1-1.05-1.295c-.59-1.044-.784-2.284-.67-3.482.116-1.199.526-2.356 1.082-3.43.643-1.244 1.516-2.418 2.732-3.09a4.14 4.14 0 0 1 1.973-.537zm9.83 6.81c.042.367.071.739.071 1.117 0 5.497-4.452 9.953-9.95 9.953a9.917 9.917 0 0 1-7.59-3.53 18.138 18.138 0 0 0 3.17-1.06c.461.346.967.634 1.507.84 1.59.61 3.392.52 4.996-.035 1.603-.555 3.021-1.549 4.256-2.705a18.264 18.264 0 0 0 3.54-4.58z" class="fill-silver-100"></path></svg>
              </a>
            </li>

            <li class="inline-flex list-none">
              <a href="https://elementary.io/support" target="_self" class="inline-block text-silver-100 px-[0.65rem]">Support</a>
            </li>

            <li class="inline-flex list-none">
              <a href="https://developer.elementary.io" target="_self" class="inline-block text-silver-100 px-[0.65rem]">Developer</a>
            </li>

            <li class="inline-flex list-none">
              <a href="https://elementary.io/get-involved" target="_self" class="inline-block text-silver-100 px-[0.65rem]">Get Involved</a>
            </li>

            <li class="inline-flex list-none">
              <a href="https://store.elementary.io" target="_self" class="inline-block text-silver-100 px-[0.65rem]">Store</a>
            </li>

            <li class="inline-flex list-none">
              <a href="https://blog.elementary.io" target="_self" class="inline-block text-silver-100 px-[0.65rem]">Blog</a>
            </li>
          </ul>

          <ul class="flex-0 flex items-center">
            <li class="inline-flex list-none">
              <a href="https://youtube.com/user/elementaryproject" target="_blank" rel="noopener" title="Youtube" class="inline-block px-[0.65rem]">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 6 46 40" class="h-4">
                  <path class="fill-silver-100" d="M44.9,14.5c-0.4-2.2-2.3-3.8-4.5-4.3C37.1,9.5,31,9,24.4,9c-6.6,0-12.8,0.5-16.1,1.2c-2.2,0.5-4.1,2-4.5,4.3C3.4,17,3,20.5,3,25s0.4,8,0.9,10.5c0.4,2.2,2.3,3.8,4.5,4.3c3.5,0.7,9.5,1.2,16.1,1.2s12.6-0.5,16.1-1.2c2.2-0.5,4.1-2,4.5-4.3c0.4-2.5,0.9-6.1,1-10.5C45.9,20.5,45.4,17,44.9,14.5z M19,32V18l12.2,7L19,32z"></path>
                </svg>
              </a>
            </li>

            <li class="inline-flex list-none">
              <a href="https://www.facebook.com/elementaryos" target="_blank" rel="noopener" title="Facebook" class="inline-block px-[0.65rem]">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" class="h-4">
                  <path class="fill-silver-100" d="M279.14 288l14.22-92.66h-88.91v-60.13c0-25.35 12.42-50.06 52.24-50.06h40.42V6.26S260.43 0 225.36 0c-73.22 0-121.08 44.38-121.08 124.72v70.62H22.89V288h81.39v224h100.17V288z"></path>
                </svg>
              </a>
            </li>

            <li class="inline-flex list-none">
              <a href="https://mastodon.social/@elementary" target="_blank" rel="noopener" title="Mastodon" class="inline-block px-[0.65rem]">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="h-4">
                  <path class="fill-silver-100" d="M433 179.11c0-97.2-63.71-125.7-63.71-125.7-62.52-28.7-228.56-28.4-290.48 0 0 0-63.72 28.5-63.72 125.7 0 115.7-6.6 259.4 105.63 289.1 40.51 10.7 75.32 13 103.33 11.4 50.81-2.8 79.32-18.1 79.32-18.1l-1.7-36.9s-36.31 11.4-77.12 10.1c-40.41-1.4-83-4.4-89.63-54a102.54 102.54 0 0 1-.9-13.9c85.63 20.9 158.65 9.1 178.75 6.7 56.12-6.7 105-41.3 111.23-72.9 9.8-49.8 9-121.5 9-121.5zm-75.12 125.2h-46.63v-114.2c0-49.7-64-51.6-64 6.9v62.5h-46.33V197c0-58.5-64-56.6-64-6.9v114.2H90.19c0-122.1-5.2-147.9 18.41-175 25.9-28.9 79.82-30.8 103.83 6.1l11.6 19.5 11.6-19.5c24.11-37.1 78.12-34.8 103.83-6.1 23.71 27.3 18.4 53 18.4 175z"></path>
                </svg>
              </a>
            </li>

            <li class="inline-flex list-none">
              <a href="https://www.reddit.com/r/elementaryos" target="_blank" rel="noopener" title="Reddit" class="inline-block px-[0.65rem]">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="h-4">
                  <path class="fill-silver-100" d="M201.5 305.5c-13.8 0-24.9-11.1-24.9-24.6 0-13.8 11.1-24.9 24.9-24.9 13.6 0 24.6 11.1 24.6 24.9 0 13.6-11.1 24.6-24.6 24.6zM504 256c0 137-111 248-248 248S8 393 8 256 119 8 256 8s248 111 248 248zm-132.3-41.2c-9.4 0-17.7 3.9-23.8 10-22.4-15.5-52.6-25.5-86.1-26.6l17.4-78.3 55.4 12.5c0 13.6 11.1 24.6 24.6 24.6 13.8 0 24.9-11.3 24.9-24.9s-11.1-24.9-24.9-24.9c-9.7 0-18 5.8-22.1 13.8l-61.2-13.6c-3-.8-6.1 1.4-6.9 4.4l-19.1 86.4c-33.2 1.4-63.1 11.3-85.5 26.8-6.1-6.4-14.7-10.2-24.1-10.2-34.9 0-46.3 46.9-14.4 62.8-1.1 5-1.7 10.2-1.7 15.5 0 52.6 59.2 95.2 132 95.2 73.1 0 132.3-42.6 132.3-95.2 0-5.3-.6-10.8-1.9-15.8 31.3-16 19.8-62.5-14.9-62.5zM302.8 331c-18.2 18.2-76.1 17.9-93.6 0-2.2-2.2-6.1-2.2-8.3 0-2.5 2.5-2.5 6.4 0 8.6 22.8 22.8 87.3 22.8 110.2 0 2.5-2.2 2.5-6.1 0-8.6-2.2-2.2-6.1-2.2-8.3 0zm7.7-75c-13.6 0-24.6 11.1-24.6 24.9 0 13.6 11.1 24.6 24.6 24.6 13.8 0 24.9-11.1 24.9-24.6 0-13.8-11-24.9-24.9-24.9z"></path>
                </svg>
              </a>
            </li>

            <li class="inline-flex list-none">
              <a href="https://elementaryos.stackexchange.com" target="_blank" rel="noopener" title="StackExchange" class="inline-block px-[0.65rem]">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="h-4">
                  <path class="fill-silver-100" d="M17.7 332.3h412.7v22c0 37.7-29.3 68-65.3 68h-19L259.3 512v-89.7H83c-36 0-65.3-30.3-65.3-68v-22zm0-23.6h412.7v-85H17.7v85zm0-109.4h412.7v-85H17.7v85zM365 0H83C47 0 17.7 30.3 17.7 67.7V90h412.7V67.7C430.3 30.3 401 0 365 0z"></path>
                </svg>
              </a>
            </li>

            <li class="inline-flex list-none">
              <a href="https://twitter.com/elementary" target="_blank" rel="noopener" title="Twitter" class="inline-block px-[0.65rem]">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="h-4">
                  <path class="fill-silver-100" d="M459.37 151.716c.325 4.548.325 9.097.325 13.645 0 138.72-105.583 298.558-298.558 298.558-59.452 0-114.68-17.219-161.137-47.106 8.447.974 16.568 1.299 25.34 1.299 49.055 0 94.213-16.568 130.274-44.832-46.132-.975-84.792-31.188-98.112-72.772 6.498.974 12.995 1.624 19.818 1.624 9.421 0 18.843-1.3 27.614-3.573-48.081-9.747-84.143-51.98-84.143-102.985v-1.299c13.969 7.797 30.214 12.67 47.431 13.319-28.264-18.843-46.781-51.005-46.781-87.391 0-19.492 5.197-37.36 14.294-52.954 51.655 63.675 129.3 105.258 216.365 109.807-1.624-7.797-2.599-15.918-2.599-24.04 0-57.828 46.782-104.934 104.934-104.934 30.213 0 57.502 12.67 76.67 33.137 23.715-4.548 46.456-13.32 66.599-25.34-7.798 24.366-24.366 44.833-46.132 57.827 21.117-2.273 41.584-8.122 60.426-16.243-14.292 20.791-32.161 39.308-52.628 54.253z"></path>
                </svg>
              </a>
            </li>

            <li class="inline-flex list-none">
              <a href="https://community-slack.elementary.io/" target="_blank" rel="noopener" title="Slack" class="inline-block px-[0.65rem]">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="h-4">
                  <path class="fill-silver-100" d="M94.12 315.1c0 25.9-21.16 47.06-47.06 47.06S0 341 0 315.1c0-25.9 21.16-47.06 47.06-47.06h47.06v47.06zm23.72 0c0-25.9 21.16-47.06 47.06-47.06s47.06 21.16 47.06 47.06v117.84c0 25.9-21.16 47.06-47.06 47.06s-47.06-21.16-47.06-47.06V315.1zm47.06-188.98c-25.9 0-47.06-21.16-47.06-47.06S139 32 164.9 32s47.06 21.16 47.06 47.06v47.06H164.9zm0 23.72c25.9 0 47.06 21.16 47.06 47.06s-21.16 47.06-47.06 47.06H47.06C21.16 243.96 0 222.8 0 196.9s21.16-47.06 47.06-47.06H164.9zm188.98 47.06c0-25.9 21.16-47.06 47.06-47.06 25.9 0 47.06 21.16 47.06 47.06s-21.16 47.06-47.06 47.06h-47.06V196.9zm-23.72 0c0 25.9-21.16 47.06-47.06 47.06-25.9 0-47.06-21.16-47.06-47.06V79.06c0-25.9 21.16-47.06 47.06-47.06 25.9 0 47.06 21.16 47.06 47.06V196.9zM283.1 385.88c25.9 0 47.06 21.16 47.06 47.06 0 25.9-21.16 47.06-47.06 47.06-25.9 0-47.06-21.16-47.06-47.06v-47.06h47.06zm0-23.72c-25.9 0-47.06-21.16-47.06-47.06 0-25.9 21.16-47.06 47.06-47.06h117.84c25.9 0 47.06 21.16 47.06 47.06 0 25.9-21.16 47.06-47.06 47.06H283.1z"></path>
                </svg>
              </a>
            </li>
          </ul>
        </nav>
      </header>

      <div {{ $attributes->merge(['class' => 'flex-1 flex flex-col']) }}>
        {{ $slot }}
      </div>

      <footer class="bg-silver-100 dark:bg-black-500 flex flex-wrap-reverse justify-between px-4 py-2 items-center flex-0">
        <p class="text-black-300 dark:text-silver-300 text-sm">
          © {{ date("Y") }} elementary, Inc
        </p>

        <ul class="flex-0 inline-block">
          <li class="inline-block list-none"><a class="text-black-300 dark:text-silver-300 text-sm px-2" href="https://elementary.io/press" target="_self">Press</a></li>
          <li class="inline-block list-none"><a class="text-black-300 dark:text-silver-300 text-sm px-2" href="https://elementary.io/brand" target="_self">Brand</a></li>
          <li class="inline-block list-none"><a class="text-black-300 dark:text-silver-300 text-sm px-2" href="https://elementary.io/oem" target="_self">OEMs</a></li>
          <li class="inline-block list-none"><a class="text-black-300 dark:text-silver-300 text-sm px-2" href="https://elementary.io/privacy" target="_self">Privacy</a></li>
          <li class="inline-block list-none"><a class="text-black-300 dark:text-silver-300 text-sm px-2" href="https://elementary.io/team" target="_self">Team</a></li>
          <li class="inline-block list-none"><a class="text-black-300 dark:text-silver-300 text-sm px-2" href="https://elementary.io/open-source" target="_self">Open Source</a></li>
        </ul>
      </footer>
    </body>
</html>
