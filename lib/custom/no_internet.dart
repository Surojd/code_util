import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  final Future<void> Function({int page}) onTap;

  const NoInternet({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return EmptyOption(
      title: 'No Internet Connection',
      message: 'Try these steps to get back online.',
      btnText: 'Reload',
      onTap: onTap,
      list: const [
        'Check your modem or router',
        'Reconnect to Wi-Fi',
      ],
    );
  }
}

class EmptyOption extends StatelessWidget {
  final String message;

  final void Function()? onTap;

  final String? btnText;

  final String? note;
  final Color? color;

  final Widget? image;

  final String? title;

  final List<String> list;

  const EmptyOption({
    super.key,
    required this.message,
    this.btnText,
    this.onTap,
    this.color,
    this.note,
    this.image,
    this.title,
    this.list = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0x00000000),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(50),
                ),
                color: const Color(0x1f8C57FF),
              ),
              child: const Icon(Icons.wifi_off_rounded, size: 50),
            ),
            if (title != null)
              Text(
                title!,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            if (title != null) const SizedBox(height: 8),
            Text(
              message,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: color),
              textAlign: TextAlign.center,
            ),
            if (list.isNotEmpty) ...[
              const SizedBox(height: 8),
              ...list.map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle_rounded,
                        color: Theme.of(context).textTheme.titleMedium?.color,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        e,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: color),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            ],
            const SizedBox(height: 16),
            if (btnText != null && onTap != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [TextButton(onPressed: onTap!, child: Text(btnText!))],
              ),
            if (note != null) const SizedBox(height: 16),
            if (note != null)
              Text(
                note!,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
