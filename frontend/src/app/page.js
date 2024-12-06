import Image from "next/image";

export default function Home() {
  return (
    <div className="flex flex-col min-h-screen max-w-[1200px] mx-auto border-l border-r border-gray-200">
      <main className="flex flex-col gap-8 row-start-2 items-center sm:items-start">
        <div className="row-1 flex flex-col gap-4 items-center sm:items-start">
          <h1 className="text-4xl font-bold text-center sm:text-left">
            Twitter Clone
          </h1>
          <p className="text-center sm:text-left">
            This is a Twitter clone built with Next.js, Tailwind CSS, and
            Prisma.
          </p>
          <p className="text-center sm:text-left">
            The app is deployed on Vercel and uses Prisma for database
            management.
          </p>
          <button className="bg-blue-500 text-white px-4 py-2 rounded-full">
            Login
          </button>
        </div>
        <div className="row-1 flex flex-col gap-4 items-center sm:items-start">
          <div className="mx-10 flex flex-row items-start justify-start gap-6">
            <img
              src="https://pbs.twimg.com/profile_images/1592141916958732288/I1Exgy1C_400x400.jpg"
              alt="Deploy with Vercel"
              className="cursor-pointer h-12 w-12 rounded-full"
            />
            <p className="text-blue-300 border border-blue-300 px-2 text-sm rounded-full">
              Everyone
            </p>
          </div>
        </div>
        <div className="row-2 flex flex-col gap-4 items-center sm:items-start w-full">
          <div className="mx-10 w-full flex flex-row items-center justify-center gap-6">
            <textarea
              type="text"
              placeholder="What's happening?"
              rows={4}
              className="border border-gray-300 rounded-lg px-4 py-2 w-[60vw] focus:outline-none text-black"
            />
            <button className="bg-blue-500 text-white px-4 py-2 rounded-full">
              Tweet
            </button>
          </div>
        </div>
        <div className="row-2 flex flex-col gap-4 items-center sm:items-start w-full">
          <div className="mx-10 w-full flex flex-row items-center justify-center gap-6">
            <button className="bg-blue-500 text-white px-4 py-2 rounded-full">
              Get Tweets
            </button>
          </div>
        </div>

      </main>
    </div>
  );
}
