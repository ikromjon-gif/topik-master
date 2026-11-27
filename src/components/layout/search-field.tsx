import { SearchIcon } from "@/components/ui/icons";
import { cn } from "@/lib/cn";

/**
 * Qidiruv maydoni: oddiy GET forma (/search?q=...).
 * JavaScript'siz ham ishlaydi; qidiruv natijalari keyingi bosqichda.
 */
export function SearchField({
  className,
  defaultValue,
  id = "global-search",
}: {
  className?: string;
  defaultValue?: string;
  /** Sahifada ikkinchi qidiruv maydoni bo‘lsa, takrorlanmaydigan id bering. */
  id?: string;
}) {
  return (
    <form action="/search" method="get" role="search" aria-label="Sayt bo‘yicha qidiruv" className={cn("relative", className)}>
      <label htmlFor={id} className="sr-only">
        Qidirish
      </label>
      <SearchIcon className="pointer-events-none absolute top-1/2 left-3.5 size-5 -translate-y-1/2 text-subtle" />
      <input
        id={id}
        name="q"
        type="search"
        defaultValue={defaultValue}
        placeholder="Qidirish (so‘z, grammatika, dars...)"
        autoComplete="off"
        className={cn(
          "h-11 w-full rounded-control border border-border bg-surface pr-4 pl-11 text-body text-foreground",
          "placeholder:text-subtle transition-colors duration-150",
          "focus:border-primary focus:outline-none focus:ring-3 focus:ring-primary/20",
        )}
      />
    </form>
  );
}
