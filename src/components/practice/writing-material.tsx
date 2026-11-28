import type { WritingMaterial as Material } from "@/lib/content/queries";

/** 53-topshiriq uchun ma’lumot jadvali (grafik o‘rnida matnli jadval — ekran o‘quvchilar uchun ham qulay). */
export function WritingMaterial({ material }: { material: Material }) {
  const { title, note, survey, columns, rows, extra } = material;
  if (!rows?.length && !extra?.length) return null;

  return (
    <figure className="mt-3 rounded-control border border-border bg-surface-muted p-3">
      {title && (
        <figcaption lang="ko" className="mb-2 text-caption font-semibold text-foreground">
          {title}
        </figcaption>
      )}
      {survey && (
        <p lang="ko" className="mb-2 text-caption text-muted">
          {survey}
        </p>
      )}
      {rows?.length ? (
        <div className="overflow-x-auto">
          <table lang="ko" className="w-full min-w-48 text-left text-caption tabular-nums">
            {columns?.length ? (
              <thead>
                <tr className="border-b border-border">
                  {columns.map((c) => (
                    <th key={c} scope="col" className="py-1.5 pr-4 font-semibold text-foreground">
                      {c}
                    </th>
                  ))}
                </tr>
              </thead>
            ) : null}
            <tbody>
              {rows.map((row) => (
                <tr key={row.join("|")} className="border-b border-border last:border-0">
                  {row.map((cell, i) =>
                    i === 0 ? (
                      <th key={i} scope="row" className="py-1.5 pr-4 font-medium text-foreground">
                        {cell}
                      </th>
                    ) : (
                      <td key={i} className="py-1.5 pr-4 text-foreground">
                        {cell}
                      </td>
                    ),
                  )}
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      ) : null}
      {extra?.length ? (
        <ul lang="ko" className="mt-2 flex list-disc flex-col gap-1 pl-5 text-caption text-foreground">
          {extra.map((e) => (
            <li key={e}>{e}</li>
          ))}
        </ul>
      ) : null}
      {note && <p className="mt-2 text-caption text-muted">{note}</p>}
    </figure>
  );
}
