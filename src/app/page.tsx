import { redirect } from "next/navigation";

/** Bosh manzil Dashboard'ga yo‘naltiriladi. */
export default function Home() {
  redirect("/dashboard");
}
