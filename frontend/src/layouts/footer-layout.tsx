
function footer() {

  return (
    <footer className="flex min-h-[6vh] flex-col items-center bg-zinc-900 py-3 pt-10 text-center text-white sm:flex-row sm:justify-center sm:py-3">
  <div className="mb-8 mt-8">
    <section className="flex items-center text-xs sm:text-sm">
      Find an issue with this page?
    </section>

    <section className="flex items-center pl-8 text-xs sm:text-sm">
      Need help? Connect with us.
    </section>

    <section className="mt-4 flex items-center pl-16 text-xs">
      <span className="mr-2">&copy;</span>
      All Rights Reserved
    </section>
  </div>
</footer>

  );
}

export default footer;
