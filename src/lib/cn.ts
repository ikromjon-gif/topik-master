/** Klass nomlarini birlashtiradi; false/null/undefined qiymatlar tashlab yuboriladi. */
export function cn(...classes: Array<string | false | null | undefined>): string {
  return classes.filter(Boolean).join(" ");
}
